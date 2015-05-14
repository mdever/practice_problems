module Distance where 
lDistance xs ys 
    | null xs = (length ys, if (null ys) then "All Done" else "Inserting " ++ (show ys))
    | null ys = (length xs, if (null xs) then "All Done" else "Inserting " ++ (show xs))
    | otherwise = let (replaceCost, prev1) = lDistance (tail xs) (tail ys)
                      (insertCost, prev2) = lDistance xs (tail ys)
                      (deleteCost, prev3) = lDistance (tail xs) ys
				  in
                      minPair [ (replaceCost + (cost xs ys), replacementMessage ++ prev1),  (insertCost + 1, insertionMessage ++ prev2), (deleteCost + 1, deletionMessage ++ prev3) ]
    where
        minPair (x:xs) = foldl (\x1 x2 -> if (fst x1) < (fst x2) then x1 else x2) x xs
        cost xs ys
        	| null xs = length ys
        	| null ys = length xs
        	| otherwise = if (head xs) == (head ys) then 0 else 1
        replacementMessage = if (cost xs ys) == 0 then ("Letters match at " ++ ((show . head) xs) ++ ". Continuing\n")  else ("Replacing " ++ ((show . head) xs) ++ " with " ++ ((show . head) ys) ++ "\n")
        insertionMessage   = "Inserting " ++ ((show . head) ys) ++ "\n"
        deletionMessage    = "Deleting "  ++ ((show . head) xs) ++ "\n"


--main = do
--	putStrLn "Please Enter your first word"
--	firstWord <- getLine
--	putStrLn "Please Enter your second word"
--	secondWord <- getLine
--	let (distance, steps) = lDistance firstWord secondWord in
--	    putStrLn ("\n\n" ++ steps) >> putStrLn  ("The distance between " ++ firstWord ++ " and " ++ secondWord ++ " is " ++ (show distance))