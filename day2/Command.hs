module Command (
    Command(Forward, Up, Down), 
    SubCoord,
    parseCommand,
    readCommandsList,
    prodSubCoord) where

data Command = Forward Integer | Up Integer | Down Integer deriving (Show)
type SubCoord = (Integer, Integer) --- (Horizontal position, Vertical position)

parseCommand :: Command -> SubCoord
parseCommand (Forward steps) = (steps, 0)
parseCommand (Up steps)      = (0, -steps)
parseCommand (Down steps)    = (0, steps) -- Going deeper is the positive direction

prodSubCoord :: SubCoord -> Integer
prodSubCoord (posX, posY) = posX * posY

updateSubCoord :: SubCoord -> Command -> SubCoord
updateSubCoord (horiPos, vertPos) com = (horiPos + hstep, vertPos + vstep)
    where
        (hstep, vstep) = parseCommand com

readCommandsList :: SubCoord -> [Command] -> SubCoord
readCommandsList subCoord []                 = subCoord
readCommandsList subCoord (headCom:commands) = readCommandsList newSubCoord commands
    where
        newSubCoord = updateSubCoord subCoord headCom
