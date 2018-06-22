#!/bin/sh

#  clear.sh
#  DyamkInjector
#
#  Created by soulghost on 22/6/2018.
#  Copyright © 2018 soulghost. All rights reserved.

cd /opt/Dyamk/dylib
if [ -e "DyamkInjector.framework" ]; then
    rm -r DyamkInjector.framework
fi
