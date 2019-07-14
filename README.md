# booth_multiplier
Booth algorithm is a procedure for the multiplication of binary numbers in 2's complement representation.
It requires examination of the multiplier bits and shifting of the partial product. Prior to the shifting, the multiplicand may be added to the partial product, subtracted from the partial product, or left unchanged according to the following rules: 
1. The multiplicand is subtracted from the partial product upon encountering the first least significant 1 in a string of 1's in the multiplier. 
2. The multiplicand is added to the partial product upon encountering the first 0 (provided that there was a previous 1) in a string of O's in the multiplier. 
3. The partial product does not change when the multiplier bit is identical to the previous multiplier bit. 

The algorithm works for positive or negative multipliers in 2's complement representation. 
