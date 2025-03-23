-- Data types
type Board = [[Int]]

data Solutions = NoSolution | UniqueSolution | MultipleSolutions deriving (Show, Eq)

{- numSolutions board
   Determines the number of solutions for the given Sudoku board.
   PRE: The board is a valid n x n Sudoku board, where n is a perfect square.
   RETURNS: NoSolution if the board has no solution,
            UniqueSolution if the board has exactly one solution,
            MultipleSolutions if the board has more than one solution.
   SIDE EFFECTS: None.
-}
numSolutions :: Board -> Solutions
numSolutions board =
  in case solve board 0 0 0 of
       0 -> NoSolution
       1 -> UniqueSolution
       _ -> MultipleSolutions
  

{- checkRow board row num
   Checks if num is present in the given row of the board.
   PRE: 0 <= row < n; The board has dimensions n x n.
   RETURNS: True if num is present in the row, False otherwise.
   EXAMPLES:
     checkRow exampleGrid 1 4 = True
     checkRow exampleGrid 2 9 = False
-}
checkRow :: Board -> Int -> Int -> Bool
checkRow board row num = num `elem` (board !! row)

{- checkColumn board col num
   Checks if num is present in the given column of the grid.
   PRE: 0 <= col < n; The board has dimensions n x n.
   RETURNS: True if num is in the column, False otherwise.
   EXAMPLES:
     checkColumn exampleGrid 0 5 = True
     checkColumn exampleGrid 0 9 = False
-}
checkColumn :: Board -> Int -> Int -> Bool
checkColumn board col num = num `elem` [row !! col | row <- board]
{- checkSubgrid board row col num
   Checks if num is in the subgrid containing the cell.
   PRE: 0 <= row, col < n; The board has dimensions n x n.
   RETURNS: True if num is present in the subgrid containing the cell (row, col), False otherwise.
   EXAMPLES:
     checkSubgrid exampleGrid 0 0 2 = True
     checkSubgrid exampleGrid 7 7 2 = False
-}
checkSubgrid :: Board -> Int -> Int -> Int -> Bool
checkSubgrid board row col num =
    let
        n = length board
        subgridSize = floor . sqrt . fromIntegral $ n
        startRow = (row `div` subgridSize) * subgridSize
        startCol = (col `div` subgridSize) * subgridSize
        subgrid = [board !! r !! c | r <- [startRow .. startRow + subgridSize - 1],
                                     c <- [startCol .. startCol + subgridSize - 1]]
    in num `elem` subgrid

{- isSafe grid row col num
   Determines if it's safe to place num at position (row, col) in the grid.
   PRE: 0 ≤ row, col < n; grid is an n x n Sudoku board.
   RETURNS: True if num can be placed at (row, col) without violating Sudoku rules, False otherwise.
   SIDE EFFECTS: None.
-}
isSafe :: Board -> Int -> Int -> Int -> Bool
isSafe grid row col num =
  not (checkRow grid row num) &&
  not (checkColumn grid col num) &&
  not (checkSubgrid grid row col num)

{- updateBoard grid row col num
   Returns a new grid with num placed at position (row, col).
   PRE: 0 ≤ row, col < n; grid is an n x n Sudoku board.
   RETURNS: A new grid identical to grid except that position (row, col) contains num.
   SIDE EFFECTS: None.
-}
updateBoard :: Board -> Int -> Int -> Int -> Board
updateBoard grid row col num =
  take row grid ++
  [take col (grid !! row) ++ [num] ++ drop (col + 1) (grid !! row)] ++
  drop (row + 1) grid

{- solve board row col count
   Recursively counts the number of solutions for the Sudoku board starting from position (row, col).
   PRE: 0 ≤ row, col ≤ n; count ≥ 0; board is an n x n Sudoku board.
   RETURNS: The number of solutions found so far, up to 2.
   SIDE EFFECTS: None.
   VARIANT: (n - row) * n + (n - col)
-}
solve :: Board -> Int -> Int -> Int -> Int
solve board row col count 
  | count >= 2 = count        
  | row == n = count + 1       
  | col == n = solve board (row + 1) 0 count  
  | board !! row !! col > 0 = solve board row (col + 1) count  
  | otherwise = tryNumbers [1..n] count
  where
    n = length board
    tryNumbers :: [Int] -> Int -> Int
    tryNumbers [] c = c  
    tryNumbers (num:nums) c
      | c >= 2 = c  
      | isSafe board row col num =
          let
            updatedBoard = updateBoard board row col num
            newCount = solve updatedBoard row (col + 1) c
          in
            if newCount >= 2 then newCount else tryNumbers nums newCount
      | otherwise = tryNumbers nums c


-- 4x4 Sudoku Board with a Unique Solution
board4 :: Board
board4 =
  [ [1, 0, 0, 4],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [3, 0, 0, 2]
  ]

-- 9x9 Sudoku Board with No Solution
board9x9NoSolution :: Board
board9x9NoSolution =
  [ [5, 5, 0, 0, 7, 0, 0, 0, 0],  -- Two '5's in the first row
    [6, 0, 0, 1, 9, 5, 0, 0, 0],
    [0, 9, 8, 0, 0, 0, 0, 6, 0],
    [8, 0, 0, 0, 6, 0, 0, 0, 3],
    [4, 0, 0, 8, 0, 3, 0, 0, 1],
    [7, 0, 0, 0, 2, 0, 0, 0, 6],
    [0, 6, 0, 0, 0, 0, 2, 8, 0],
    [0, 0, 0, 4, 1, 9, 0, 0, 5],
    [0, 0, 0, 0, 8, 0, 0, 7, 9]
  ]
