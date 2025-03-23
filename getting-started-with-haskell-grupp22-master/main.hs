{-
Congratulations! You've made it this far, which means you have joined the GitHub
classroom for this lab, and you can view files in your GitHub repository. So
far, so good!

Cloning and Installation
========================

Next, we want you to edit and run Haskell files (such as this one) on the lab
machines or on your own computer.

If you are working on the Windows lab computers in the basement of
Ångström House 10, you should first log in to the Linux environment.
Start the ThinLinc client from the start menu, set "Server" to
thinlinc.student.it.uu.se, set "Username" to your user identity, set
"Password" to your password A, and press "Connect".

Clone the GitHub repository into an empty folder on a lab machine or on your own
computer. See
[ https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository-from-github/cloning-a-repository ]
for instructions on how to clone GitHub repositories.

If you are using your own computer, you may need to install Git first. See
[ https://github.com/git-guides/install-git ] for instructions.

If you need to create a personal access token to authenticate yourself with
GitHub, see
[ https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token ]
for instructions.

If you are using your own computer and you haven't already done so, you should
now install GHC and a Haskell-aware editor. Please follow the instructions at
[ https://uppsala.instructure.com/courses/53071/pages/installing-ghc-on-your-own-computer ].
Alternatively, you can use one of the lab machines (where Haskell is already
pre-installed), also over SSH.

If the installation was successful (or if you are working on a lab machine), you
should be able to run GHCi from the command line: enter

  ghci

at the terminal prompt. You should now see GHCi's "Prelude>" prompt.

Haskell Exercises
=================

Let's now do some exercises to get started with Haskell.

Do not despair if you cannot do everything yet. Do as much as you can. We
understand that students may have different backgrounds and preliminary
knowledge.

Sometimes students have difficulties to get started, but we have seen many
students that made a tremendous breakthrough from zero knowledge to loving
functional programming in a short period of time. Work with your group partner,
and do not hesitate to ask the teaching assistants for help or hints during the
lab. Not all exercises have been covered in lectures yet. You can also try
examples presented in lectures or course literature.

You do not need to submit your answers for correction, but if you want (or have
questions), you can show them to a teaching assistant during the lab for rapid
feedback.

If, on the other hand, you do not feel that these excercises are difficult
enough for you, try to solve your own problem/puzzle using Haskell. You can
find a lot of fun programming problems at Project Euler
[ https://projecteuler.net/ ]!

Problem 1
---------

In this problem you use Haskell as a calculator, and apply some built-in
functions. If you do not recognize them from lectures or don't remember what
they mean, that's okay. If you can't guess what they mean simply based on our
suggested computations below, try the same functions but on other arguments. If
that does not help, have a look in the course literature, the slides for the
first few lectures, or search online, e.g., at
[ https://www.haskell.org/hoogle/ ].

Haskell documentation is a crucial resource, not only for finding information
about known functions, but also for finding other useful functions to help you
solve programming problems. Use it freely!

Go through the following expressions, one at a time. First, discuss with your
lab partner what you believe GHCi will compute - in other words, what the value
of the expression is (or if it has a value at all). Then, enter the expression
at the GHCi prompt. Do you get the result that you expected?

 1. 1477
 2. div 15 2
 3. 15 `div` 2
 4. 15 div 2
 5. 15.0 / 2.0
 6. 15.0 `div` 2.0
 7. "x" ++ "yz"
 8. x ++ "yz"
 9. show 7
10. read "7" :: Integer
11. take 4 "Computer Science!"
12. take 7 (drop 9 "Computer Science!")
13. take 7 drop 9 "Computer Science!"
14. "anders" < "andersson"
15. 65 < 150 || 19
16. 1 `div` 0 < 3 && 2.0 < 1.0
17. 2.0 < 1.0 && 1 `div` 0 < 3

Problem 2
---------

Enter the following expressions at the GHCi prompt.

 1. round 3.4
 2. round 3.4 + 10.0
 3. round (3.4 + 10.0)
 4. 1 + 2 * 3
 5. (1 + 2) * 3
 6. 3 * 2 + 1
 7. (3 * 2) + 1
 8. 7+6
 9. 7 + 6
10. 17 `div` 3
11. div (17 3)
12. not (not True)
13. (not not) True

For each expression, try to figure out which function(s) are applied to what
argument(s). What impact do parentheses have? What about whitespace?

Problem 3
---------

Let's now make some changes to this file (main.hs). Open your local copy in an
editor (for instance, on the lab machines you could use emacs). Add the
following two declarations (in separate lines) at the very end of this file:

  radius = 5.0
  area = pi * radius * radius

After you have edited and saved main.hs, load it into GHCi by typing (at the
GHCi prompt)

  :load main

At the GHCi prompt, enter the expression

  area

What is its value?

Pushing to GitHub
=================

To make the changes that you have made to main.hs permanent, you need to commit
them to your (local) repository clone, and then push them to your GitHub
repository. See
[ https://github.com/git-guides/git-commit ]
and
[ https://github.com/git-guides/git-push ]
for instructions on how to commit and push.

Take another look at your repository on github.com. You should be able to see
the changes in main.hs that you just pushed. (Refresh the page in your browser
if necessary.)

Well done! This concludes the warm-up lab. If you want, you can of course keep
working with your repository (even after this lab ends) and try other examples
and programming exercises.

There is nothing to hand in: this lab is not assessed. When you are done, you
may simply leave. Please talk to our teaching assistants if you have questions
or need help!


(Add the declarations for Problem 3 below.)
-}
