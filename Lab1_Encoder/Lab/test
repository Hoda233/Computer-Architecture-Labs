vlog encoder.v
vsim encoder
add wave -position end  sim:/encoder/in
add wave -position end  sim:/encoder/out
add wave -position end  sim:/encoder/enable
for { set b 0}  {$b < 2} {incr b} {
for { set a 1}  {$a < 4} {incr a} {
   force -freeze sim:/encoder/in 00000001 0
   force -freeze sim:/encoder/in($a) 1 0
   force -freeze sim:/encoder/enable $b 0
   run
}
}
for { set b 0}  {$b < 2} {incr b} {
for { set a 0}  {$a < 8} {incr a} {
   force -freeze sim:/encoder/in 00000000 0
   force -freeze sim:/encoder/in($a) 1 0
   force -freeze sim:/encoder/enable $b 0
   run
}
}
