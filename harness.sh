#!/bin/bash

# Usage: ./harness.sh <cmd>
# <cmd> is expected to receive text via STDIN and print the results to STDOUT.
# For example:
#   $ cat > literature
#   This is a
#   working Pig Latin
#   translator!
#
#   $ ruby pig_latin.rb < literature
#   Isthay isway away
#   orkingway Igpay Atinlay
#   anslatortray!


for testfile in $(ls tests/*.in); do
  echo Testing $* $testfile
  expectation=$(echo $testfile | sed 's/\.in/\.out/')
  diff <($* < $testfile) $expectation && echo 'Pass'
done
