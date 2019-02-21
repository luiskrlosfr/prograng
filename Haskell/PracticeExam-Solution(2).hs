module PracticeExam where

enigmaA :: Int -> Int -> [Int]
enigmaA 0 _ = [] 
enigmaA _ 0 = []
enigmaA n m = take (m - n) [n..]

-- enigmaA 0 10 => []
-- enigmaA 5 10 => [5, 6, 7, 8, 9]

enigmaB :: (Int, Int, [Int]) -> [Int]
enigmaB (x, 0, (y:z)) = [x, 0, y]
enigmaB (x, y, []) = [y, x]
enigmaB (x, y, z) = filter (> x * y) z

-- enigmaB (1, 3, [6, -2, 5]) => [6, 5]
-- enigmaB (9, 0, [2, 3, 1]) => [9, 0, 2]

enigmaC :: [t] -> t
enigmaC [] = error "Empty list."
enigmaC (x:y:z) = y

-- enigmaC [1, 2] => 2
-- enigmaC [3, 2, 1] => 2

enigmaD :: [Int] -> [Int] -> [Int]
enigmaD _ [] = []
enigmaD [] _ = []
enigmaD a b = [xs * ys | (x, xs) <- z, (y, ys) <- z] where
    z = zip (reverse a) b

-- enigmaD [1, 2] [3, 4] => [9, 12, 12, 16]
-- enigmaD [0, 3] [2, 1] => [4, 2, 2, 1]

--(\x y -> if x >= y then x - y else x + y) 5 3

minMax :: [Int] -> (Int, Int)
minMax (x:y) = ((minNum x y), (maxNum x y))

maxNum :: Int -> [Int] -> Int
maxNum x [] = x
maxNum x (y:z) = if x >= y
    then maxNum x z
    else maxNum y z

minNum :: Int -> [Int] -> Int
minNum x [] = x
minNum x (y:z) = if x <= y
    then minNum x z
    else minNum y z

-- minMax [8, 3, 2, 7, 6, 12] Solucion mia

minmax :: [Int] -> (Int, Int)
minmax x = (myMin x, myMax x)

myMin :: [Int] -> Int
myMin [] = error "The list is empty."
myMin [x] = x
myMin (x:xs) = if x <= y then x else y
    where y = myMin xs

myMax :: [Int] -> Int
myMax [] = error "The list is empty."
myMax [x] = x
myMax (x:xs) = if x >= y then x else y
    where y = myMax xs


-- minmax [8, 3, 2, 7, 6, 12] Solucion del Profe

data RGB = RGB Int Int Int deriving Show

getR :: RGB -> Int
getR (RGB r _ _) = r

getG :: RGB -> Int
getG (RGB _ g _) = g

getB :: RGB -> Int
getB (RGB _ _ b) = b

getMaxComponent :: RGB -> ([Char], Int)
getMaxComponent (RGB r g b)
    | maximum [r, g, b] == r = ("Red", r)
    | maximum [r, g, b] == g = ("Green", g)
    | maximum [r, g, b] == b = ("Blue", b)

combine :: RGB -> RGB -> RGB
combine (RGB r1 g1 b1) (RGB r2 g2 b2) = (RGB (div (r1 + r2) 2) (div (g1 + g2) 2) (div (b1 + b2) 2))

-- combine (RGB 100 200 180) (RGB 150 140 220) 