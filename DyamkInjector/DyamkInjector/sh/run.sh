#!/bin/sh

#  run.sh
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


from="DyamkInjector.framework/DyamkInjector"
to="DyamkInjector.framework/DyamkInjector_"$v
mv $from $to

# add version
v="$(($v+1))"
echo $v > $number_name
