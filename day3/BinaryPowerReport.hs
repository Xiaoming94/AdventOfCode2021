module BinaryPowerReport (
   Bin,
   BinReport 
) where

-- Defining a type for binary numbers
-- This number is defined backwards because this is easier to work with
data Bin = MSB | One Bin | Zero Bin deriving Show

asDigits :: Bin -> Integer
asDigits bin = asDigits' bin 0 0
    where
        asDigits' (MSB) binNum _         = binNum
        asDigits' (One rest) binNum pos  = asDigits' rest (binNum + 10 ^ pos) (pos + 1)
        asDigits' (Zero rest) binNum pos = asDigits' rest binNum (pos + 1)  

type BinReport = [[Integer]]
