import Data.Matrix
import qualified Data.Vector as V

newtype (Neighbors a) = Neighbors [Maybe a] deriving Show

topLeft (Neighbors xs) = head xs
top (Neighbors xs) = xs !! 1
topRight (Neighbors xs) = xs !! 2
left (Neighbors xs) = xs !! 3
right (Neighbors xs) = xs !! 4
bottomLeft (Neighbors xs) = xs !! 5
bottom (Neighbors xs) = xs !! 6
bottomRight (Neighbors xs) = xs !! 7
getNeighbs (Neighbors ns) = ns

newtype LifeRule a = LifeRule { rule :: (Neighbors a -> a) }

neighborsFor mat (r, c) = Neighbors $ resolveNeighbors $ map checkBounds [(r-1, c-1), (r-1, c), (r-1, c+1), 
                                                                          (r, c-1),             (r, c+1),
                                                                          (r+1, c-1), (r+1, c), (r+1, c+1)]
                              where
                                   checkBounds (rw, cl) = if (rw == 0 || rw > numRows || cl == 0 || cl > numCols) then Nothing else Just (rw, cl)
                                   resolveNeighbors ns
                                       | (null ns) = []
                                       | otherwise = case (head ns) of
                                           Nothing -> Nothing : (resolveNeighbors (tail ns))
                                           Just (r, c) -> (Just (getElem r c mat)) : (resolveNeighbors (tail ns))
                                   numRows = nrows mat
                                   numCols = ncols mat


simpleLifeRule = LifeRule $ \neighbs -> if (countActive (getNeighbs neighbs)) >= 2 && (countActive (getNeighbs neighbs)) < 5 then 1 else 0
                 where
                 	countActive ns = foldl (\n1 n2 -> case n2 of
                 		                                  Nothing -> n1
                 		                                  Just something -> if something == 0 then n1 else n1 + 1) 0 ns

indices :: (Matrix a) -> (Matrix (Int, Int))
indices mat = matrix (nrows mat) (ncols mat) (\(r, c) -> (r, c))

flattenMat :: (Matrix a) -> [a]
flattenMat mat = concat $ (flattenMat' mat 1)
                 where
                 	flattenMat' mat n
                 	    | n > (nrows mat) = []
                 	    | otherwise = (V.toList (getRow n mat)) : (flattenMat' mat (n+1))

lifeStep (LifeRule rule) mat = fromList (nrows mat) (ncols mat) $ map rule (map (neighborsFor mat) (flattenMat (indices mat)))                 	    

testMat = (setElem 1 (3,3)) (setElem 1 (3,2) (setElem 1 (2,3) (zero 5 5)))