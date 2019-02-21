module A01113431_HW08 where

-- Inverts a list
invert :: [t] -> [t]
invert [] = []
invert (x:y) = invert y ++ [x]

-- Evaluation of polynomials
evaluate :: [Double] -> Double -> Double
evaluate [] n = 0.0
evaluate (x:y) n = (x * (n ^ (length y))) + (evaluate y n)

-- Multiples
multiples :: [Int] -> Int -> [Int]
multiples lst n = filter (\x -> mod x n == 0) lst

-- Cleans a string. Given a string, return recursively a "cleaned" string where adjacent chars that are the same have been reduced to a single char. So "yyzzza" yields "yza".
cleanString :: [Char] -> [Char]
cleanString [] = []
cleanString (x:[]) = [x]
cleanString (x:y:z) = if x == y
    then cleanString (x : z)
    else x : cleanString (y : z)

-- Returns a string with the binary representation of an integer value
toBinaryString :: Int -> [Char]
toBinaryString 0 = ['0']
toBinaryString x = if mod x 2 == 0
    then toBinaryString (quot x 2) ++ ['0']
    else toBinaryString (quot x 2) ++ ['1']

-- Insertion sort
insertionSort :: [Int] -> [Int]
insertionSort [] = []
insertionSort (x:y) = sortInsertion x (insertionSort y)

sortInsertion :: Int -> [Int] -> [Int]
sortInsertion x [] = [x]
sortInsertion x (y:z) = if x <= y
    then x : y : z
    else y : (sortInsertion x z)