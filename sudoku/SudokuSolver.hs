-- \/\/\/ DO NOT MODIFY THE FOLLOWING LINES \/\/\/
module SudokuSolver(Board, Solutions(..), author, nickname, numSolutions) where
import Sudoku(Board, Solutions(..))

-- /\/\/\ DO NOT MODIFY THE PRECEDING LINES /\/\/\



author :: String
author = "Gustav Boberg"  

nickname :: String
nickname = "backtrackbaby"  

{- This is my implementation of a Soduko solver that can solve nxn boards.
The primary function, numSolutions, takes a Board and calls the solver (solve) which uses recursive backtracking to explore all possible solutions.
The solver works by checking each cell in the grid starting from the top-left corner.
If a cell is already filled, it moves to the next cell.
When the solver encounters an empty cell, it calls tryNumbers.
The function (tryNumbers) tries to place a number that does not break the sudoku rules.
It uses helper functions to ensure that the move follows Sudoku rules.
The number must not already exist in the same row (checkRow), column (checkColumn), or the subgrid (checkSubgrid).
The canPlace function combines these checks to check the legality of placing a number in a cell.
When a valid number is placed, we jump back to (solve) with the updated board and the next cell is processed. 
When the solver reaches a point where there are no valid numbers it can place, it will backtrack. 
The recursion continues until it reaches the end or if two solutions have already been found. 
It terminates early after having found two solutions and returns MultipleSolutions because this was much faster than looking for all solutions.
This solution is very slow for boards larger than 9x9. 
I took inspiration from the chapter about backtracking in https://en.wikipedia.org/wiki/Sudoku_solving_algorithms. 
 -}



{- numSolutions board
   Calculates the number of solutions for a given Sudoku board.
   PRE: The board is a valid nxn Sudoku board.
   RETURNS: NoSolution if the board has no solution,
            UniqueSolution if the board has exactly one solution,
            MultipleSolutions if the board has more than one solution.
   EXAMPLES:
     numSolutions emptyBoard = MultipleSolutions
     numSolutions impossibleBoard = NoSolution
-}
numSolutions :: Board -> Solutions
numSolutions board 
    | not (isValidBoard board) = NoSolution
    | otherwise = case solve board 0 0 0 of
        0 -> NoSolution
        1 -> UniqueSolution
        _ -> MultipleSolutions

{- isValidBoard board
   Checks if a Sudoku board is valid.
   PRE: The board is a nxn Sudoku board.
   RETURNS: True if the board is valid, False otherwise.
   EXAMPLES: 
     isValidBoard [[1,2,3],[4,5,6],[7,8,9]] = True
     isValidBoard [[1,2,2],[4,5,6],[7,8,9]] = False because of duplicate 2 in first row
-}
isValidBoard :: Board -> Bool
isValidBoard board = all (isValidCell board) [(r,c) | r <- [0..n-1], c <- [0..n-1]]
  where
    n = length board
    isValidCell board (r,c) = 
        let num = board !! r !! c
        in num == 0 || isValidNumber board r c num
    
    isValidNumber board row col num =
        let tempBoard = updateBoard board row col 0 
        in canPlace tempBoard row col num

{- checkRow grid row num
   Checks if num is present in the given row of the board.
   PRE: 0 <= row < n; 
   RETURNS: True if num is present in the row  False otherwise.
   EXAMPLES:
     checkRow exampleGrid 1 4 = True
     checkRow exampleGrid 2 9 = False
-}
checkRow :: Board -> Int -> Int -> Bool
checkRow board row num = num `elem` (board !! row)

{- checkColumn board col num
   Checks if num is present in the given column of the grid.
   PRE: 0 <= col < n; 
   RETURNS: True if num is in the column, False otherwise.
   EXAMPLES:
     checkColumn exampleGrid 0 5 = True
     checkColumn exampleGrid 0 9 = False
-}
checkColumn :: Board -> Int -> Int -> Bool
checkColumn board col num = num `elem` [row !! col | row <- board]
{- checkSubgrid board row col num
   Checks if num is in the subgrid containing the cell.
   PRE: 0 <= row, col < n; 
   RETURNS: True if num is present in the subgrid containing the cell (row, col), False otherwise.
   EXAMPLES:
     checkSubgrid exampleGrid 0 0 2 = True
     checkSubgrid exampleGrid 7 7 2 = False
-}
checkSubgrid :: Board -> Int -> Int -> Int -> Bool
checkSubgrid board row col num =
    let
        n = length board
        subgridSize = floor (sqrt (fromIntegral n))  
        startRow = (row `div` subgridSize) * subgridSize
        startCol = (col `div` subgridSize) * subgridSize
        subgrid = [board !! r !! c | r <- [startRow .. startRow + subgridSize - 1],
                                     c <- [startCol .. startCol + subgridSize - 1]]
    in num `elem` subgrid


{- canPlace grid row col num
   Determines if it is safe to place num at position a position in the grid.
   PRE: 0 <= row, col < n; 
   RETURNS: True if num can be placed at (row, col) without breaking Sudoku rules, False otherwise.
   EXAMPLES:
     canPlace emptyGrid 0 0 3 = True
     canPlace gridWithThreeAtZeroZero 0 0 3 = False
-}
canPlace :: Board -> Int -> Int -> Int -> Bool
canPlace board row col num =
    not (checkRow board row num) &&
    not (checkColumn board col num) &&
    not (checkSubgrid board row col num)


{- updateBoard grid row col num
   Creates a new board with num placed at position (row, col).
   PRE: 0 <= row, col < n; 
   RETURNS: A new board with num added at (row, col)
   EXAMPLES:
     updateBoard emptyGrid 0 0 5 = gridWithFiveAtZeroZero
-}
updateBoard :: Board -> Int -> Int -> Int -> Board
updateBoard board row col num =
    take row board ++
    [take col (board !! row) ++ [num] ++ drop (col + 1) (board !! row)] ++
    drop (row + 1) board

{- solve board row col count
   Counts the number of solutions for the Sudoku board starting from position (row, col).
   It uses the helper function (tryNumbers) to attempt placing numbers in empty cells.
   PRE: 0 <= row, col <= n; count >= 0; board is an n x n Sudoku board. 
   RETURNS: The number of solutions found so far (<=2)
   VARIANT: (n - row) * n + (n - col), where n is the board size
           This decreases with each recursive call as we move right (col increases)
           or down (row increases) through the board
-}
solve :: Board -> Int -> Int -> Int -> Int
solve board row col count
    | count >= 2 = count  -- Stop if two solutions are found
    | row == length board = count + 1  -- Increment count when a solution is found
    | col == length board = solve board (row + 1) 0 count  -- Move to the next row
    | board !! row !! col > 0 = solve board row (col + 1) count  -- Skip filled cells
    | otherwise = tryNumbers board row col count 1

{- tryNumbers board row col count num
   Tries placing numbers from num to n in the given cell and continues solving recursively.
   This helper function is called by (solve) when an empty cell is encountered.
   PRE: 1 <= num <= n+1; count >= 0; board is an n x n Sudoku board.
   RETURNS: The number of solutions found so far (<=2)
   VARIANT: n + 1 - num, where n is the board size
           This decreases with each recursive call as num increases towards n+1
-}
tryNumbers :: Board -> Int -> Int -> Int -> Int -> Int
tryNumbers board row col count num
    | count >= 2 = count  
    | num > n = count  
    | canPlace board row col num =
        let updatedBoard = updateBoard board row col num
            newCount = solve updatedBoard row (col + 1) count
        in if newCount >= 2 then newCount else tryNumbers board row col newCount (num + 1)
    | otherwise = tryNumbers board row col count (num + 1)
  where
    n = length board
