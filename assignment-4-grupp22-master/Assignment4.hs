{- Functional Programming 1
   Assignment 4
 -}
-- \/\/\/ DO NOT MODIFY THE FOLLOWING LINES \/\/\/
module Assignment4(answer11,answer12,answer13,answer14,answer15,
                   reverseIO,
                   connected) where

import Graph
-- /\/\/\ DO NOT MODIFY THE PRECEDING LINES /\/\/\

{- Exercise 1: Tail Recursion
   ==========================

   Which of the following functions are tail recursive?

   Replace `undefined' by `True' if the corresponding function is tail
   recursive, and by `False' otherwise.
 -}

{- length :: [a] -> Int
   length []     = 0
   length (_:xs) = 1 + length xs
 -}
answer11 :: Bool
answer11 = undefined  -- replace `undefined' by `True' or `False'

{- elem :: Eq a => a -> [a] -> Bool
   elem _ []     = False
   elem x (y:ys) = x==y || elem x ys
 -}
answer12 :: Bool
answer12 = undefined  -- replace `undefined' by `True' or `False'

{- filter :: (a -> Bool) -> [a] -> [a]
   filter pred []     = []
   filter pred (x:xs)
     | pred x         = x : filter pred xs
     | otherwise      = filter pred xs
 -}
answer13 :: Bool
answer13 = undefined  -- replace `undefined' by `True' or `False'

{- foldr :: (a -> b -> b) -> b -> [a] -> b
   foldr f b []     = b
   foldr f b (x:xs) = f x (foldr f b xs)
 -}
answer14 :: Bool
answer14 = undefined  -- replace `undefined' by `True' or `False'

{- foldl :: (a -> b -> a) -> a -> [b] -> a
   foldl f b []     = b
   foldl f b (x:xs) = foldl f (f b x) xs
 -}
answer15 :: Bool
answer15 = undefined  -- replace `undefined' by `True' or `False'


{- Exercise 2: I/O Actions
   =======================

   Define an I/O action `reverseIO' that, when performed,

     i)  reads lines from standard input until it reads an empty line, and
     ii) writes the (non-empty) lines to standard output in reverse order.

   Example:

     hello     <-- input
     world     <-- input
               <-- input
     world     <-- output
     hello     <-- output
-}

{- (Remember to provide a complete specification of the I/O action.)
 -}
reverseIO :: IO ()
reverseIO = undefined  -- remove `undefined' and define your I/O action here


{- Exercise 3: Graphs
   ==================

   Read and follow the instructions in the file Graph.hs.
 -}


{- Exercise 4: Connected Vertices
   ==============================

   Define a function `connected' such that `connected g u v' returns `True' if
   (and only if) the graph g contains a path from vertex u to vertex v.

   A path from u to v is a sequence of vertices s_1, s_2, ..., s_n (where
   n >= 1) such that s_1 = u, s_n = v, and for all 1 <= i < n, s_(i+1) is a
   neighbor of s_i.

   Note that according to this definition, each vertex is connected to itself.

   ONLY USE THE OPERATIONS EXPORTED BY THE `Graph' MODULE TO OPERATE ON GRAPHS.
   DO NOT USE THE CONSTRUCTOR(S) OF THE `Graph a' TYPE DIRECTLY.

   Hint: A path from u to v, if it exists, can be found by traversing g using
         depth-first or breadth-first search (starting at u).
 -}

{- (Remember to provide a complete function specification.)
 -}
connected :: Eq a => Graph a -> a -> a -> Bool

-- (If your function is recursive, remember to provide a variant.)
connected = undefined  -- remove `= undefined' and define your function here
