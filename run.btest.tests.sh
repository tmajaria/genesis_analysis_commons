#!/bin/sh

btestdir="tests/btest/"
optfile="tests/btest/options.json"

btests=`ls -d ${btestdir}btest*.json`

for bt in $btests
do
    echo $bt
    java -jar /Users/tmajaria/Documents/projects/src/cromwell-36.jar run genesis_btest.wdl -i $bt -o $optfile
done