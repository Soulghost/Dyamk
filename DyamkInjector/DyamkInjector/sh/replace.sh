#!/bin/sh

#  replacer.sh
#  DynamicKit
#
#  Created by soulghost on 22/6/2018.
#  Copyright © 2018 soulghost. All rights reserved.

cd /opt/Dyamk/dylib
path=`pwd`'/'
number_name='framework_version'
number=$path$number_name
v=0
if [ -e $number ]; then
v=`cat $number_name`
else
echo 0 > $number_name
fi
sed -i -e 's/DyamkNativeInjector_[0-9]*/DyamkNativeInjector_'$v'/g' ${SRCROOT}'/DyamkInjector/core/DyamkNativeInjector.m'

