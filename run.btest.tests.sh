#!/bin/sh

btestdir="tests/btest/"

btests=`ls -d ${btestdir}*`

for bt in $btests
do
    echo $bt
    runwdl genesis_btest.wdl $bt
done