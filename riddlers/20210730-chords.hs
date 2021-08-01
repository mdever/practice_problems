import Data.Complex

genPoints p =
    let
        pts = [ (sum [ (p^(n-1)) * (exp ((0 :+ 1) * (fromIntegral n) * (fromIntegral theta) * (pi/24))) | n <- [1..100]]) | theta <- [0..48]]
    in
        zipWith (\r i -> (r, i)) (fmap realPart pts) (fmap imagPart pts)

main = do
    putStrLn $ show $ genPoints (1/2)
