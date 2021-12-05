module Command (
    Command(Forward, Up, Down), 
    SubCoord,
    parseCommand) where

data Command = Forward Integer | Up Integer | Down Integer deriving (Show)
type SubCoord = (Integer, Integer) --- (Horizontal position, Vertical position)

parseCommand :: Command -> SubCoord
parseCommand (Forward steps) = (steps, 0)
parseCommand (Up steps)      = (0, steps)
parseCommand (Down steps)    = (0, -steps)

prodSubCoord :: SubCoord -> Integer
prodSubCoord (posX, posY) = posX * posY

moveSub :: SubCoord -> Command -> SubCoord
moveSub (horiPos, vertPos) com = (horiPos + hstep, vertPos + vstep)
    where
        (hstep, vstep) = parseCommand com    
