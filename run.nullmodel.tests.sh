#!/bin/sh

nulldir="tests/nullmodel/"

nulltests=`ls -d ${nulldir}*`

for nt in $nulltests
do
    echo $nt
    runwdl genesis_nullmodel.wdl $nt
done