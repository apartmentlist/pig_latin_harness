#!/bin/bash

for testfile in $(ls tests/*.in); do
  echo Testing $* $testfile
  expectation=$(echo $testfile | sed 's/\.in/\.out/')
  diff <($* < $testfile) $expectation && echo 'Pass'
done
