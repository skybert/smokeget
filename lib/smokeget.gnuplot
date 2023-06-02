#                                              -*- perl -*-
set title "SmokeGET\nURL" font ",14"

set ylabel "Response time in seconds"
set xdata time
set timefmt "%Y-%m-%d-%H:%M:%S"
set format x "%H:%M"

# Output as an SVG
set term svg
set output "OUTPUT"
plot 'DATA' using 1:2 lt rgb '#141a5b' w l title 'Response time'
