module Command (
    Command(Forward, Up, Down), 
    SubCoord,
    parseCommand) where

data Command = Forward Integer | Up Integer | Down Integer deriving (Show)
type SubCoord = (Integer, Integer)

parseCommand :: Command -> Integer
parseCommand (Forward steps) = steps
parseCommand (Up steps)      = steps
parseCommand (Down steps)    = -steps

prodSubCoord :: SubCoord -> Integer
prodSubCoord (posX, posY) = posX * posY