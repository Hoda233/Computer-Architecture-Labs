In the encoder module, Ihave the following cases:
- Enable = 0 -> Output = zzz
- Enable = 1 & a valid input -> The appropriate output
- Enable = 1 & an invalid input -> Output = xxx

There are 2 do files:
1. test 
It contains some test cases using for loop  
- Enable=0, invalid input (0000_0011, 0000_0101, 0000_1001)
- Enable=1, invalid input (same as previous)
- Enable=0, valid input (00000001, 00000010, 00000100, 00001000, 00010000, 00100000, 01000000, 10000000)
- Enable=1, valid input (same as previous)

2. stress-test 
It contains 256 possible inputs from 00000000 to 11111111 for Enable = 0 and Enable = 1

To run:
do test.do
do stress_test.do