#!/bin/bash


for i in *; do elapsed=$(cat $i | grep Time elapsed | head -n 1 | awk {print 3}); total=$(cat $i | grep Time elapsed|Total time | tail -n 1 | awk {print }); echo "$elapsed $total $(echo "scale=3; $total - $elapsed" | bc)"; done | sort -n -k 3 > diff.txt

for i in *; do elapsed=$(cat $i | grep Time elapsed | head -n 1 | awk {print 3}); total=$(cat $i | grep Time elapsed|Total time | tail -n 1 | awk {print }); echo "$elapsed $total $(echo "scale=3; ($total - $elapsed) / $total" | bc)"; done | sort -n -k 3 >  time_diff_ratio.txt
