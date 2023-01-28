vlog encoder.v
vsim encoder
add wave -position end  sim:/encoder/in
add wave -position end  sim:/encoder/out
add wave -position end  sim:/encoder/enable
proc dec2bin int {
    set binRep [binary format c $int]
    binary scan $binRep B* binStr
    return [string trimleft $binStr 0]
}
for { set b 0}  {$b < 2} {incr b} {
for { set a 0}  {$a < 256} {incr a} {
   set c [dec2bin $a]
   force -freeze sim:/encoder/in $c 0
   force -freeze sim:/encoder/enable $b 0
   run
}
}


