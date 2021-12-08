module BinaryPowerReport (
   Bin (..),
   calcTemperature
) where

import Data.List

-- Defining a type for binary numbers
-- This number is defined backwards because this is easier to work with
data Bin = LSB | One Bin | Zero Bin deriving Show
type BinReport = [[Integer]]

exInput = [
           [0,0,1,0,0]
          ,[1,1,1,1,0]
          ,[1,0,1,1,0]
          ,[1,0,1,1,1]
          ,[1,0,1,0,1]
          ,[0,1,1,1,1]
          ,[0,0,1,1,1]
          ,[1,1,1,0,0]
          ,[1,0,0,0,0]
          ,[1,1,0,0,1]
          ,[0,0,0,1,0]
          ,[0,1,0,1,0]
          ]

toBinary :: (Integral a) => [a] -> Bin
toBinary []   = LSB
toBinary (x:xs)
    | x == 1    = One $ toBinary xs
    | otherwise = Zero $ toBinary xs

asDigits :: Bin -> Integer
asDigits bin = asDigits' bin 0 0
    where
        asDigits' (LSB) binNum _         = binNum
        asDigits' (One rest) binNum pos  = asDigits' rest (binNum + 10 ^ pos) (pos + 1)
        asDigits' (Zero rest) binNum pos = asDigits' rest binNum (pos + 1)  

-- Function for decoding a binary number
toInt :: (Integral a) => Bin -> a
toInt = flip decode 0
    where
        decode LSB val         = val
        decode (Zero rest) val = decode rest (2 * val)
        decode (One rest)  val = decode rest (2 * val + 1) 

-- Function for counting zeros
countZeros :: Bin -> Integer
countZeros = flip countZeros' 0
    where
        countZeros'  LSB zeros        = zeros
        countZeros' (Zero rest) zeros = countZeros' rest (zeros + 1)
        countZeros' (One rest) zeros  = countZeros' rest zeros

-- Function for counting ones
countOnes :: Bin -> Integer
countOnes = flip countOnes' 0
    where
        countOnes'  LSB ones        = ones
        countOnes' (Zero rest) ones = countOnes' rest ones 
        countOnes' (One rest) ones  = countOnes' rest (ones + 1)

-- Function for counting both ones and zeros and build a pair
countOnesAndZeros :: Bin -> (Integer, Integer)
countOnesAndZeros bin = (countOnes bin, countZeros bin)

-- Flipping zeros to ones and ones to zeros in a binary number
binNot :: Bin -> Bin
binNot LSB         = LSB
binNot (One rest)  = Zero (binNot rest)
binNot (Zero rest) = One (binNot rest)

-- Calculate Gamma and Epsilon from pairs of ones and zeros counts

calcGamma :: [(Integer, Integer)] -> Bin
calcGamma []         = LSB
calcGamma ((ones,zeros):pairsList)
    | ones > zeros = One (calcGamma pairsList)
    | otherwise    = Zero (calcGamma pairsList)

calcEpsilon :: Bin -> Bin
calcEpsilon = binNot 

calcTemperature :: BinReport -> Integer
calcTemperature report = toInt gamma * toInt epsilon
    where
        processedReportData = processReportData report
        gamma               = calcGamma processedReportData
        epsilon             = calcEpsilon gamma 

processReportData :: BinReport -> [(Integer,Integer)]
processReportData report = map (countOnesAndZeros . toBinary) $ transpose report


-- Calculating life support rating algorithms, these are for Problem 2
scrubOxygen :: BinReport -> Bin
scrubOxygen report = toBinary $ scrubOxygenAlg report processedReportData 0
    where
        processedReportData = processReportData report
        scrubOxygenAlg [binNumber] _ _                  = binNumber
        scrubOxygenAlg binReport pairsList bitPlace 
            | ones < zeros = scrubOxygenAlg keepZerosRest newPairsList (bitPlace + 1)
            | otherwise    = scrubOxygenAlg keepOnesRest newPairsList (bitPlace + 1)
            where 
                (ones, zeros) = pairsList !! bitPlace
                keepOnesRest  = filter (\x -> x !! bitPlace == 1) binReport 
                keepZerosRest = filter (\x -> x !! bitPlace == 0) binReport
                newPairsList  = if ones < zeros then
                                    processReportData keepZerosRest 
                                else
                                    processReportData keepOnesRest

scrubCO2 :: BinReport -> Bin
scrubCO2 report = toBinary $ scrubCO2Alg report processedReportData 0
    where
        processedReportData = processReportData report
        scrubCO2Alg [binNumber] _ _                  = binNumber
        scrubCO2Alg binReport pairsList bitPlace 
            | ones > zeros = scrubCO2Alg keepZerosRest newPairsList (bitPlace + 1)
            | otherwise    = scrubCO2Alg keepOnesRest newPairsList (bitPlace + 1)
            where 
                (ones, zeros) = pairsList !! bitPlace
                keepOnesRest  = filter (\x -> x !! bitPlace == 1) binReport 
                keepZerosRest = filter (\x -> x !! bitPlace == 0) binReport
                newPairsList  = if ones < zeros then
                                    processReportData keepZerosRest 
                                else
                                    processReportData keepOnesRest

calcLifeSupportRating :: BinReport -> Integer
calcLifeSupportRating report = (toInt . scrubOxygen $ report) * (toInt . scrubCO2 $ report)
