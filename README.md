# Functional Programming

This repository contains various Haskell projects and assignments completed during a Functional Programming course. The projects showcase the application of functional programming concepts using Haskell.

## Repository Structure

### Getting Started with Haskell
- **Directory**: `getting-started-with-haskell-grupp22-master/`
- **Description**: Introduction to Haskell programming with basic examples and exercises.
- **Files**: `main.hs` - Contains basic Haskell exercises and instructions for setting up Haskell development environment.

### Assignments
- **Assignment 2** (`assignment-2/`)
  - Focus on function specifications, variants, and step-by-step evaluations
  - Includes exercises on recursive functions

- **Assignment 3** (`assignment-3/`)
  - Advanced Haskell programming concepts
  
- **Assignment 4** (`assignment-4/`)
  - Includes graph-related algorithms in Haskell

### Sudoku Solver
- **Directory**: `sudoku/`
- **Description**: Implementation of a Sudoku solver using functional programming techniques in Haskell.
- **Key files**:
  - `SudokuSolver.hs` - The main solver implementation using recursive backtracking
  - `Sudoku.hs` - Core data structures and type definitions
  - `test.hs` - Test cases and validation
  - `dataset/` - Collection of Sudoku boards for testing

## Sudoku Solver Implementation

The Sudoku solver implements a recursive backtracking algorithm that:
- Processes the board cell by cell from the top-left corner
- Tries valid numbers for each empty cell
- Checks row, column, and subgrid constraints
- Backtracks when no valid number can be placed
- Efficiently terminates after finding multiple solutions

The implementation handles boards of different sizes and demonstrates key functional programming concepts such as recursion and immutable data structures.

## Technologies

- **Language**: Haskell
- **Development Environment**: GHC (Glasgow Haskell Compiler)

## Author

- Gustav Boberg 