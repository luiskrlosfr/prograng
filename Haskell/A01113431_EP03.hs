module A01113431_EP03 where

-- Get multiplication table of N from 1 to 10
multiplicationTable :: Int -> [Int]
multiplicationTable n = map (* n) [1..10]

-- Get transpose of a Matrix
transposeMatrix :: [[Int]] -> [[Int]]
transposeMatrix mat = map head mat : transposeMatrix (map tail mat)