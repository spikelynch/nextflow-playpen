#!/usr/bin/env python

# this reverses each line

import sys


for l in sys.stdin:
    line = l[:-1]
    print(line[::-1])

