
type Board = [[Int]]

-- Function to calculate subgrid dimensions
calculateSubgridDimensions :: Int -> (Int, Int)
calculateSubgridDimensions n =
    let factors = map fst $ factorise (fromIntegral n)
        possibleDimensions = [(i, n `div` i) | i <- factors, n `mod` i == 0]
        -- Prefer dimensions where subgrid is as square as possible
        sortedDimensions = sortBy (\(a1, b1) (a2, b2) ->
            compare (abs (a1 - b1)) (abs (a2 - b2))) possibleDimensions
    in if not (null sortedDimensions)
        then head sortedDimensions
        else (1, n)  -- Default to 1 x n subgrids if no factors found


sudokuSolver :: Board -> Int
sudokuSolver board = solve board 0 0
  where
    n = length board
    subgridRows = fst $ calculateSubgridDimensions n
    subgridCols = snd $ calculateSubgridDimensions n

    solve :: Board -> Int -> Int -> Int
    solve board row col
        | row == n = 1  
        | col == n = solve board (row + 1) 0
        | board !! row !! col > 0 = solve board row (col + 1)
        | otherwise = sum (map tryNum [1..n])
      where
        tryNum num
            | isSafe board row col num =
                solve (updateBoard board row col num) row (col + 1)
            | otherwise = 0

    isSafe :: Board -> Int -> Int -> Int -> Bool
    isSafe grid row col num =
        not (checkRow grid row num) &&
        not (checkColumn grid col num) &&
        not (checkSubgrid grid row col num)

    checkRow :: Board -> Int -> Int -> Bool
    checkRow grid row num = num `elem` (grid !! row)

    checkColumn :: Board -> Int -> Int -> Bool
    checkColumn grid col num = num `elem` [grid !! r !! col | r <- [0..n - 1]]

    checkSubgrid :: Board -> Int -> Int -> Int -> Bool
    checkSubgrid grid row col num =
        let startRow = (row `div` subgridRows) * subgridRows
            startCol = (col `div` subgridCols) * subgridCols
            subgrid = [grid !! r !! c |
                r <- [startRow .. startRow + subgridRows - 1],
                c <- [startCol .. startCol + subgridCols - 1]]
        in num `elem` subgrid

    
    updateBoard :: Board -> Int -> Int -> Int -> Board
    updateBoard grid row col num =
        take row grid ++
        [take col (grid !! row) ++ [num] ++ drop (col + 1) (grid !! row)] ++
        drop (row + 1) grid
