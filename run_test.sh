#!/bin/sh

result=0
cd ./build
echo `pwd`
for case_bin in `ls | grep "test_"`
do
    echo ${case_bin}
    if [ -x ${case_bin} ];then
        ./${case_bin} --gtest_output="xml:../${case_bin}.xml";
        if [ $? -eq 1 ];then
            echo " ${case_bin} failed"
            result=1
        fi
    else
        continue;
    fi
done
cd ..
exit $result 
