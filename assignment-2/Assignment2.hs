{- Functional Programming 1
   Assignment 2
 -}
-- \/\/\/ DO NOT MODIFY THE FOLLOWING LINES \/\/\/
module Assignment2(answer21,answer22,answer23,answer24,answer25,
           sumSquareDiff,
           inter,
           isMatch) where

import Prelude hiding (product)
-- /\/\/\ DO NOT MODIFY THE PRECEDING LINES /\/\/\

{- Exercise 1: Specification, Variant, Evaluation
   ==============================================

   Consider the following function declaration.

   Provide a complete function specification (in accordance with our Coding
   Convention).

   Give a variant for `product n' that proves termination for all n >= 1.

   Give (in a Haskell comment) a detailed step-by-step evaluation of
   `product 2', using the same style as in the lecture slides.   
 -}

{- (Remember to provide a complete function specification.)
 -}

-- VARIANT: ?
product :: Integer -> Integer
product 1 = 1
product n = n * product (n-1)

{- Step-by-step evaluation:

   product 2
   --> ...
 -}

{- Exercise 2: Variants
   ====================

   Which of the following expressions is an (integer-valued) variant for the
   function `multiply' below?

   Replace `undefined' by `True' if the corresponding expression is a variant,
   and by `False' otherwise.
-}

{- multiply a b
   Computes the product of two numbers.
   PRE: b >= 0
   RETURNS: a * b
   EXAMPLES: multiply 2 3 == 6, multiply (-2) 3 == -6
 -}
-- do not modify this implementation
multiply :: Integer -> Integer -> Integer
multiply a 0 = 0
multiply a b = a + multiply a (b-1)

-- 1.) a
answer21 :: Bool
answer21 = undefined  -- replace `undefined' by `True' or `False'

-- 2.) b
answer22 :: Bool
answer22 = undefined  -- replace `undefined' by `True' or `False'

-- 3.) a * b
answer23 :: Bool
answer23 = undefined  -- replace `undefined' by `True' or `False'

-- 4.) a*a + b*b
answer24 :: Bool
answer24 = undefined  -- replace `undefined' by `True' or `False'

-- 5.) 42
answer25 :: Bool
answer25 = undefined  -- replace `undefined' by `True' or `False'

{- Exercise 3: Sum-Square-Difference
   =================================

   The sum of the squares of the first ten natural numbers is

     1^2 + 2^2 + ... + 10^2 = 385

   The square of the sum of the first ten natural numbers is

     (1+2+...+10)^2 = 3025

   Hence the difference between the square of the sum of the first ten natural
   numbers and the sum of the squares is 3025 - 385 = 2640.

   Declare a function `sumSquareDiff n' that returns the difference between the
   square of the sum and the sum of the squares of all natural numbers from 1 to
   n.  (You must decide how to handle the case when n < 1.)

   (This exercise was inspired by Problem 6 at Project Euler
   [ https://projecteuler.net/ ], a web site that offers hundreds of challenging
   programming problems.)
 -}

{- (Remember to provide a complete function specification.)
 -}
sumSquareDiff :: Integer -> Integer

-- (If your function is recursive, remember to provide a variant.)
sumSquareDiff n = undefined  -- remove `undefined' and write your function body here

{- Exercise 4: Intersection
   ========================

   Finite sets of integers can be represented by lists of integers. For this
   exercise we only consider lists without duplicates, i.e., every element is
   contained in the list at most once.

   Declare a function `inter s1 s2' that returns a list representing the
   intersection of the sets s1 and s2, i.e., the set containing the elements
   that occur in both argument lists.

   Implement `inter' using recursion or list comprehension. Do NOT use
   `Data.List.intersect' or similar.

   Hint: You can use the function `elem' from the Haskell Prelude to test
   whether a given value occurs in a list.
 -}

{- (Remember to provide a complete function specification.)
 -}
inter :: [Integer] -> [Integer] -> [Integer]

-- (If your function is recursive, remember to provide a variant.)
inter s1 s2 = undefined  -- remove `undefined' and write your function body here

{- Exercise 5: Wildcard Matching
   =============================

   For this exercise, we define a /string pattern/ to be a string. String
   patterns may contain '?', '*' and any other character. (Note that this
   definition of string patterns is not related to patterns for values of type
   String in the Haskell language.)

   String patterns can /match/ a string: '?' matches any single character, and
   '*' matches any sequence of characters (including the empty sequence). Other
   characters in a string pattern only match themselves. The empty pattern only
   matches the empty string.

   Declare a function `isMatch' such that `isMatch s p' returns `True' if (and
   only if) the string pattern p matches the entire string s.

   Examples:
   - isMatch "aa" "a" == False because "a" does not match the entire string "aa"
   - isMatch "aa" "*" == True because "*" matches any sequence of characters
   - isMatch "cb" "?a" == False because '?' matches 'c' but 'a' does not match 'b'
   - isMatch "adceb" "*a*b" == True because the first '*' matches the empty
     sequence, and the second '*' matches "dce"

   Note that '?' and '*' are treated specially only in the pattern p but not in
   the string s. For instance, the pattern "*" matches the string "aa", but the
   pattern "aa" does not match the string "*".

   (This exercise was inspired by Problem 44 at LeetCode
   [ https://leetcode.com/problemset/all/ ], another web site that offers
   hundreds of challenging programming problems.)
 -}

{- (Remember to provide a complete function specification.)
 -}
isMatch :: String -> String -> Bool

-- (If your function is recursive, remember to provide a variant.)
isMatch s p = undefined  -- remove `undefined' and write your function body here
