Assumptions:
-	Write at positive edge of the clock.
-	Read at negative edge of the clock.
Testbench sequence:
At … ve edge	Test case 	                    Output 
  +	        Write 1111000011110000 at reg 0	    Write done
  -	        Read from reg 0	                    Read data = 1111000011110000
  +	        reset	                            Reset done
  -	        Read from reg 0	                    Read data = 0000000000000000
  -	        Read from reg 1	                    Read data = 0000000000000000
  +	        Write 1111111111110000 at reg 1	    Write done
  -	        Read from reg 1	                    Read data= 1111111111110000
  -	        Read from reg 2	                    Read data = 0000000000000000
  +	        Read from reg 3	                    Read data= old value
  -	        Write 1111111111111111 at reg 3	    Write not done Read data= zzzzzzzzzzzzzzzz
  + 	        Write 1111111111111111 at reg 3	    Write done
  -	        Read from reg 3	                    Read data= 1111111111111111


