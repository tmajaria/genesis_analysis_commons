#!/bin/sh

nulldir="tests/nullmodel/"
optfile="tests/nullmodel/options.json"

nulltests=`ls -d ${nulldir}nullmodel*.json`

for nt in $nulltests
do
    echo $nt
    java -jar /Users/tmajaria/Documents/projects/src/cromwell-36.jar run genesis_nullmodel.wdl -i $nt -o $optfile
done