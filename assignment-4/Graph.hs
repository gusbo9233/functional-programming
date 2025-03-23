{- Functional Programming 1

   A Module for Graphs
   ===================
 -}

-- \/\/\/ DO NOT MODIFY THE FOLLOWING LINE \/\/\/
module Graph(Graph,empty,addVertex,addEdge,vertices,neighbors) where
-- /\/\/\ DO NOT MODIFY THE PRECEDING LINE /\/\/\

{- Graphs model the connections between objects in a network. They have
   applications in computer science and many other areas. For instance, the
   topology of the Internet, the interactions between proteins in molecular
   biology, and the interactions between users on a social networking site can
   all be modeled by graphs.

   Formally, a /graph/ G = (V,E) consists of a set V of /vertices/ and a set
   E ⊆ V × V of /edges/ between these vertices. We will only consider /simple/
   graphs in this assignment. A simple graph is an undirected graph without
   multiple edges or loops. In other words, for all vertices u and v, an edge
   between u and v is the same as an edge between v and u, there is at most one
   edge between u and v, and there is no edge between u and u. See
   [ https://en.wikipedia.org/wiki/Graph_%28discrete_mathematics%29 ] for
   further explanations.

   This file defines a module `Graph' for simple graphs. This module exports a
   polymorphic type `Graph a' of simple graphs with vertices of type `a', and
   the following operations on them:

   1. To obtain an empty graph:

        empty :: Graph a

      The empty graph does not contain any vertices or edges.

   2. To add a vertex to a graph:

        addVertex :: Eq a => Graph a -> a -> Graph a

   3. To add an edge to a graph:

        addEdge :: Eq a => Graph a -> (a,a) -> Graph a

   4. To obtain a list of all vertices in a graph:

        vertices :: Eq a => Graph a -> [a]

   5. To obtain a list of all neighbors of a given vertex:

        neighbors :: Eq a => Graph a -> a -> [a]

      Vertex u is a /neighbor/ of vertex v if there is an edge between u and v.

   Your task is to implement the type `Graph a' and the above operations.

   You will need to decide what the exact preconditions for some of the
   functions should be. The preconditions for `addVertex' and `addEdge' shall
   not disallow adding a vertex (edge, respectively) that is already present in
   the graph.

   The lists returned by `vertices' and `neighbors' shall not contain any
   duplicates. Think about how to achieve this. Remember to state any invariant
   that your implementation assumes on the type `Graph a' as part of the type's
   representation comment -- see the Coding Convention for details!

   THE `Graph' MODULE SHALL NOT EXPORT ANY OTHER OPERATIONS. THE TYPE `Graph a'
   SHALL BE IMPLEMENTED BY A DATA TYPE. THE CONSTRUCTORS(S) OF THIS DATA TYPE
   SHALL NOT BE EXPORTED.

   This means that the implementation of your graph type will not be visible
   outside of the `Graph' module. Your graphs will appear as an abstract data
   type that can ONLY be accessed through the operations provided.

   You may use any suitable data structure that has been presented in class, or
   invent one yourself to implement graphs. Haskell's `Data.Graph' library might
   provide some inspiration.
 -}

{- (Remember to provide a datatype representation in accordance with our Coding
   Convention.)
 -}
data Graph a = Graph  -- remove `Graph' and write your datatype declaration here
  deriving (Show)  -- do not modify this line

empty :: Graph a  -- do not modify this line
empty = undefined  -- remove `undefined' and write your definition here

{- (Remember to provide a complete function specification.)
 -}
addVertex :: Eq a => Graph a -> a -> Graph a
addVertex = undefined  -- remove `= undefined' and define your function here

{- (Remember to provide a complete function specification.)
 -}
addEdge :: Eq a => Graph a -> (a,a) -> Graph a
addEdge = undefined  -- remove `= undefined' and define your function here

{- (Remember to provide a complete function specification.)
 -}
vertices :: Eq a => Graph a -> [a]
vertices = undefined  -- remove `= undefined' and define your function here

{- (Remember to provide a complete function specification.)
 -}
neighbors :: Eq a => Graph a -> a -> [a]
neighbors = undefined  -- remove `= undefined' and define your function here
