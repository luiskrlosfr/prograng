module A01113431_HW09 where
-- Summarize data of two column table
tableSummarization :: [([Char], Double)] -> [([Char], Double)]
tableSummarization lst = [("Male", sumNumbers (filter ((=="Male").fst) lst) / sizeOfList (filter ((=="Male").fst) lst))] ++ [("Female", sumNumbers (filter ((=="Female").fst) lst) / sizeOfList (filter ((=="Female").fst) lst))] 

sumNumbers :: [([Char], Double)] -> Double
sumNumbers [] = 0.0
sumNumbers ((gender, val):lst) = val + sumNumbers lst

sizeOfList :: [([Char], Double)] -> Double
sizeOfList [] = 0.0
sizeOfList (x:y) = 1.0 + sizeOfList y

-- Return all record that are below a threshold
listComprehension :: [([Char], Double)] -> Double -> [([Char], Double)]
listComprehension lst x = (filter ((< x).snd) lst)

-- Returns node with largest degree
data Node = Node Char [Char] deriving Show
data Graph = Graph [Node] deriving Show

-- Node 'A' "BCD" where A is the name of the Node and BCD are its edges
-- Graph [Node 'A' "BCD", Node 'B' "CF"] where Node A is directed to B, C, and D and Node B is directed to C and F
degreeNode :: Graph -> Node
degreeNode (Graph g) = getHighest (head g) (tail g)

getHighest :: Node -> [Node] -> Node
getHighest (Node n z) [] = (Node n z)
getHighest (Node n z) g = if length z > (getDegree (head g))
    then getHighest (Node n z) (tail g)
    else getHighest (head g) (tail g)

getDegree :: Node -> Int
getDegree (Node x y) = length y
