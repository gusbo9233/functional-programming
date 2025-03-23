{- Functional Programming 1
   Assignment 3
 -}
-- \/\/\/ DO NOT MODIFY THE FOLLOWING LINES \/\/\/
module Assignment3(Vehicle(..),
            fastestAffordable,
            BSTree(Void,BSNode),
            subTree,
            Tree(..),
            count,labels,height,
            append,elem,last,reverse,filter) where

import Prelude hiding (elem,last,reverse,filter) -- You will be re-implementing
  -- these functions in Exercise 4. Feel free to use (your own implementations
  -- of) `elem', `last', `reverse', and `filter' in your solutions for Exercises
  -- 1-3.

-- /\/\/\ DO NOT MODIFY THE PRECEDING LINES /\/\/\

{- Exercise 1: Vehicles
   ====================

   1. We consider three kinds of vehicles: bicycles, cars, and airplanes.

      Give a datatype declaration for the type `Vehicle'. The datatype should
      reflect that there are three kinds of vehicles, so the datatype definition
      should have three cases (constructors): `Bicycle', `Car', and `Airplane'.

      Each vehicle has a manufacturer (given as a value of type `String') and a
      price (given as a non-negative value of type `Integer'). Additionally,
      cars and airplanes have a maximum speed (given as a non-negative value of
      type `Double').
 -}

{- (Remember to provide a datatype representation in accordance with our Coding
   Convention.)
 -}
data Vehicle = Vehicle  -- remove `Vehicle' and write your datatype declaration here
  deriving (Eq,Show)  -- do not modify this line

{- 2. Define a function

        fastestAffordable :: Integer -> [Vehicle] - Maybe Vehicle

      This function should take a price threshold and a list of vehicles, and
      return the fastest vehicle in the list whose price does not exceed the
      given threshold.

      If there are multiple fastest vehicles whose price does not exceed the
      given threshold, it should return any one of them. If there is no vehicle
      whose price does not exceed the given threshold, it should return
      `Nothing'.

      For the purpose of this exercise, assume that all bicycles have the same
      speed, and that bicycles are always slower than cars and airplanes
      (regardless of their speed value).
 -}

{- (Remember to provide a complete function specification.)
 -}
fastestAffordable :: Integer -> [Vehicle] -> Maybe Vehicle

-- (If your function is recursive, remember to provide a variant.)
fastestAffordable = undefined  -- remove `= undefined' and define your function here


{- Exercise 2: Binary Search Trees
   ===============================

   The nodes of a binary search tree are ordered from left to right according to
   their key value. Consider the following datatype declaration of binary search
   trees:
 -}

{- Binary search trees with Integer labels

   Void represents an empty tree. BSNode l x r represents a tree with
   left subtree l, root label x, and right subtree r.

   INVARIANT: in every tree of the form BSNode l x r, all labels in l
     are < x, and all labels in r are > x.
 -}
data BSTree = Void | BSNode BSTree Integer BSTree  -- do not modify this line
  deriving (Eq,Show)  -- do not modify this line

{- Define a function

     subTree :: Integer -> Integer -> BSTree -> BSTree

   such that `subTree a b t' yields a binary search tree containing the keys in
   `t' that are greater than or equal to `a' but smaller than `b'.

   Example: Assume that `t' is defined as follows:

     t = BSNode (BSNode (BSNode Void 0 (BSNode Void 2 Void))
                        3
                        (BSNode Void 5 Void))
                6
                (BSNode Void
                        7
                        (BSNode Void 8 (BSNode Void 9 Void)))

   We now have

     subTree 5 8 t == BSNode (BSNode Void 5 Void)
                             6
                             (BSNode Void 7 Void)

   (The tree produced by your solution might be shaped differently, but it
   should also contain the keys 5, 6 and 7, and no other keys.) We also have

     subTree 10 20 t == Void

   This question can (and should) be solved without introducing intermediate
   data structures (such as lists).
 -}

{- (Remember to provide a complete function specification.)
 -}
subTree :: Integer -> Integer -> BSTree -> BSTree

-- (If your function is recursive, remember to provide a variant.)
subTree = undefined  -- remove `= undefined' and define your function here


{- Exercise 3: Trees
   =================

   1. Define a datatype `Tree a' of (finitely branching) labeled trees. Each
      node (`Node') carries a label (of polymorphic type `a') and may have an
      arbitrary (non-negative) number of children. Different nodes may have
      different numbers of children. Each tree has at least one node (so there
      should be no `Void' case in your datatype definition).

      See [ https://en.wikipedia.org/wiki/Tree_%28data_structure%29 ] for
      further definitions and some hints.
 -}

{- (Remember to provide a datatype representation in accordance with our Coding
   Convention.)
 -}
data Tree a = Tree  -- remove `Tree' and write your datatype declaration here
  deriving (Eq,Show)  -- do not modify this line

{- 2. Define functions to

      (a) compute the number of nodes in such a tree:

            count :: Tree a -> Integer

      (b) compute the list of all node labels in such a tree:

            labels :: Tree a -> [a]

      (c) compute the height of such a tree:

            height :: Tree a -> Integer

          The height of a leaf (that is, a node with no children) should be 0.

      Hint: a possible solution is to use helper functions and mutual recursion.
      Another solution uses higher-order functions such as `map'.
 -}

{- (Remember to provide a complete function specification.)
 -}
count :: Tree a -> Integer
count = undefined  -- remove `= undefined' and define your function here

{- (Remember to provide a complete function specification.)
 -}
labels :: Tree a -> [a]
labels = undefined  -- remove `= undefined' and define your function here

{- (Remember to provide a complete function specification.)
 -}
height :: Tree a -> Integer
height = undefined  -- remove `= undefined' and define your function here


{- Exercise 4: Higher-Order Functions
   ==================================

   You have already seen recursive definitions for the functions `(++)', `elem',
   `last', `reverse' and `filter' in class. Now your task is to give
   non-recursive definitions for these functions, using the higher-order
   functions `foldl' or `foldr'. Define

   1. append :: [a] -> [a] -> [a]  (apart from its name, this should behave like (++))
   2. elem :: Eq a => a -> [a] -> Bool
   3. last :: [a] -> a
   4. reverse :: [a] -> [a]
   5. filter :: (a -> Bool) -> [a] -> [a]

   In all cases, the definition using foldl or foldr should be quite simple
   (i.e., a single line of code).
 -}

{- (Remember to provide a complete function specification.)
 -}
append :: [a] -> [a] -> [a]
append = undefined  -- remove `= undefined' and define your function here

{- (Remember to provide a complete function specification.)
 -}
elem :: Eq a => a -> [a] -> Bool
elem = undefined  -- remove `= undefined' and define your function here

{- (Remember to provide a complete function specification.)
 -}
last :: [a] -> a
last = undefined  -- remove `= undefined' and define your function here

{- (Remember to provide a complete function specification.)
 -}
reverse :: [a] -> [a]
reverse = undefined  -- remove `= undefined' and define your function here

{- (Remember to provide a complete function specification.)
 -}
filter :: (a -> Bool) -> [a] -> [a]
filter = undefined  -- remove `= undefined' and define your function here
