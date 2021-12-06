module Command (
    Command(Forward, Up, Down), 
    SubCoord,
    parseCommand,
    readCommandsList,
    prodSubCoord) where

data Command = Forward Integer | Up Integer | Down Integer deriving (Show)
type SubCoord = (Integer, Integer) --- (Horizontal position, Vertical position)
type SubWithAim = (Integer,Integer,Integer) -- Submarine with AIM

newSubWithAim = (0, 0, 0)
exCommandList = [ Forward 5
                , Down 5
                , Forward 8 
                , Up 3
                , Down 8
                , Forward 2
                ]

parseCommand :: Command -> SubCoord
parseCommand (Forward steps) = (steps, 0)
parseCommand (Up steps)      = (0, -steps)
parseCommand (Down steps)    = (0, steps) -- Going deeper is the positive direction

prodSubCoord :: SubCoord -> Integer
prodSubCoord (posX, posY) = posX * posY

prodSubCoord2 :: SubWithAim -> Integer
prodSubCoord2 (posX, posY, _) = posX * posY

updateSubCoord :: SubCoord -> Command -> SubCoord
updateSubCoord (horiPos, vertPos) com = (horiPos + hstep, vertPos + vstep)
    where
        (hstep, vstep) = parseCommand com

readCommandsList :: SubCoord -> [Command] -> SubCoord
readCommandsList subCoord []                 = subCoord
readCommandsList subCoord (headCom:commands) = readCommandsList newSubCoord commands
    where
        newSubCoord = updateSubCoord subCoord headCom

-- Here starts the function for solving problem 2
processCommandProb2 :: SubWithAim -> Command -> SubWithAim
processCommandProb2 (horiPos, vertPos, aim) com = (horiPos + hstep, vertPos + vstep, aim + daim) 
    where
        (hstep, vstep, daim)                = internProcessCommand com 
        internProcessCommand (Down step)    = (0, 0, step)
        internProcessCommand (Up step)      = (0, 0, -step)
        internProcessCommand (Forward step) = (step, step * aim, 0)
