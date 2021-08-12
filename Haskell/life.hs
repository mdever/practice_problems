import Data.Bifunctor

data Cell = On | Off
    deriving (Eq)

instance Show Cell where
    show On  = "X"
    show Off = " "

type Board = [[Cell]]

board :: Board
board = [[Off, On, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
         [Off, Off, On, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
         [On, On, On, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
         [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
         [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
         [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
         [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
         [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
         [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
         [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
         [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
         [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
         [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
         [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off]]

gospel :: Board
gospel = [[Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, On,  Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, On,  Off, On,  Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, On,  On,  Off, Off, Off, Off, Off, Off, On,  On,  Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, On,  On,  Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, On,  Off, Off, Off, On,  Off, Off, Off, Off, On,  On,  Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, On,  On,  Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, On,  On,  Off, Off, Off, Off, Off, Off, Off, Off, On,  Off, Off, Off, Off, Off, On,  Off, Off, Off, On,  On,  Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, On,  On,  Off, Off, Off, Off, Off, Off, Off, Off, On,  Off, Off, Off, On,  Off, On,  On,  Off, Off, Off, Off, On,  Off, On,  Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, On,  Off, Off, Off, Off, Off, On,  Off, Off, Off, Off, Off, Off, Off, On,  Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, On,  Off, Off, Off, On,  Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, On,  On,  Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off],
          [Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off, Off]]

data Neighborhood = Neighbors {
                             top :: Cell
                           , topRight :: Cell
                           , right :: Cell
                           , bottomRight :: Cell
                           , bottom :: Cell
                           , bottomLeft :: Cell
                           , left :: Cell
                           , topLeft :: Cell
                           }

boardAt :: Board -> (Int, Int) -> Cell
boardAt brd (row, col)
    | row < 0      = Off
    | row > maxRow = Off
    | col < 0      = Off
    | col > maxCol = Off
    | otherwise = (brd !! row) !! col
  where
    (maxRow, maxCol) = bimap dec dec (dimensions brd)
    dec = subtract 1

dimensions :: Board -> (Int, Int)
dimensions brd = (length brd, length (head brd))

neighbors :: Board -> (Int, Int) -> Neighborhood
neighbors brd (row, col) =
    Neighbors (at (row+1, col)) (at (row+1, col+1)) (at (row, col+1)) (at (row-1, col+1))
              (at (row-1, col)) (at (row-1, col-1)) (at (row, col-1)) (at (row+1, col-1))
    where
        at = boardAt brd

liveNeighbors :: Board -> (Int, Int) -> Int
liveNeighbors brd (row, col) = let
                                 neighbs = neighbors brd (row, col)
                               in
                                 count neighbs
                               where
                                 count (Neighbors t tr r br b bl l tl) = sum $ fmap toInt [t, tr, r, br, b, bl, l, tl]
                                 toInt On  = 1
                                 toInt Off = 0

showBoard :: Board -> String
showBoard (row:rows) = (showRow row) ++ "\n" ++ (showBoard rows)
    where showRow row = foldr (\cell prev -> prev ++ " " ++ (show cell)) "" row
showBoard [] = ""

update :: Board -> Board
update brd = [ [ update' (row, col) | col <- [0..cols-1] ] | row <- [0..rows-1] ]
    where (rows, cols) = dimensions brd
          update' (row, col) 
            | currentCell == On = if livingNeighbors == 2 then On else if livingNeighbors == 3 then On else Off
            | otherwise         = if livingNeighbors == 3 then On else Off
            where
              currentCell = boardAt brd (row, col)
              livingNeighbors = liveNeighbors brd (row, col)

runGame :: Board -> IO Board
runGame brd = do
    putStrLn $ showBoard brd
    getLine
    runGame $ update brd

main = runGame gospel
