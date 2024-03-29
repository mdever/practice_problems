-- https://fivethirtyeight.com/features/will-riddler-nation-win-gold-in-archery/
--
-- Suppose you have a chain with infinitely many flat (i.e., one-dimensional) links.
-- The first link has length 1, and the length of each successive link is a fraction f 
-- of the previous link’s length. As you might expect, f is less than 1.
-- You place the chain flat on a table and some ink at the very end of the chain (i.e., the end with the infinitesimal links).
--
-- Initially, the chain forms a straight line segment, and the longest link is fixed in place. From there,
-- the links are constrained to move in a very specific way: The angle between each chain and the next,
-- smaller link is always the same throughout the chain. For example, if the Nth link and the N+1st link
-- form a 40 degree clockwise angle, then so do the N+1st link and the N+2nd link.
--
-- After you move the chain around as much as you can, what shape is drawn by the ink that was at the tail end of the chain?\

import Data.Complex

genPoints p =
    let
        pts = [ finalPoint theta | theta <- [0..48]]
    in
        zip (fmap (truncate . realPart) pts) (fmap (truncate . imagPart) pts)
    where
        finalPoint angle = sum [ (p^(n-1)) * (exp ((0 :+ 1) * (fromIntegral n) * (fromIntegral angle) * (pi/24))) | n <- [1..100] ]
        truncate num 
            | (abs num) < 0.00001 = 0
            | otherwise = num

getUntilSpace :: String -> IO String
getUntilSpace existing = do
    c <- getChar
    if c == ' '
    then return existing
    else getUntilSpace (existing ++ [c])

main = do
    numChar <- getUntilSpace ""
    denomChar <- getLine
    let num = (read numChar :: Double)
    let denom = (read denomChar :: Double)
    putStrLn $ show $ genPoints ((num :+ 0)/(denom :+ 0))
    main
