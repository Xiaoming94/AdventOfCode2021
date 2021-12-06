import System.IO
import Control.Monad
import Command

main = do
    commandStringPairs <- (map words) . lines <$> readFile "./input.txt"
    let commandsList = processCommandStringList commandStringPairs
    let moveSub = readCommandsList newSub commandsList
    print $ prodSubCoord moveSub

newSub = (0,0)  

processCommandStringList :: [[String]] -> [Command]
processCommandStringList = map processCommandStringPair
    where
        processCommandStringPair [comType, stepChar]
            | comType == "forward" = Forward stepNum
            | comType == "up"      = Up stepNum
            | comType == "down"    = Down stepNum
            where
                stepNum = read stepChar :: Integer