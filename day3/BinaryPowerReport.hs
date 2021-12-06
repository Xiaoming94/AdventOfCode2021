module BinaryPowerReport (
   Bin 
) where

-- Defining a type for binary numbers
-- This number is defined backwards because this is easier to work with
data Bin = LSB | One Bin | Zero Bin deriving Show

asDigits :: Bin -> Integer
asDigits bin = asDigits' bin 0 0
    where
        asDigits' (LSB) binNum _         = binNum
        asDigits' (One rest) binNum pos  = asDigits' rest (binNum + 10 ^ pos) (pos + 1)
        asDigits' (Zero rest) binNum pos = asDigits' rest binNum (pos + 1)  

toInt :: (Integral a) => Bin -> a
toInt = flip decode 0
    where
        decode LSB val         = val
        decode (Zero rest) val = decode rest (2 * val)
        decode (One rest)  val = decode rest (2 * val + 1) 

countZeros :: Bin -> Integer
countZeros = flip countZeros' 0
    where
        countZeros'  LSB zeros        = zeros
        countZeros' (Zero rest) zeros = countZeros' rest (zeros + 1)
        countZeros' (One rest) zeros  = countZeros' rest zeros

countOnes :: Bin -> Integer
countOnes = flip countOnes' 0
    where
        countOnes'  LSB ones        = ones
        countOnes' (Zero rest) ones = countOnes' rest ones 
        countOnes' (One rest) ones  = countOnes' rest (ones + 1)
