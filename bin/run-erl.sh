#/bin/bash

rm -f *.dump
rm -f *.beam
rm -f program_output.txt

# Check compile errors
erlc solution.erl

# Run as escript - stdin crushes at windows
cat input.txt | escript.exe solution.erl > program_output.txt

# Check diff
diff -w output.txt program_output.txt | wc -l | awk '{if ($0 == 0) print "TESTS OK"; else print "*********** TESTS FAIL ************" }';
diff -w output.txt program_output.txt
