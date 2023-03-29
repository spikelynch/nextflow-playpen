#!/usr/bin/env python

# this capitalises what it gets on stdin and sends it to stdout

import sys


for l in sys.stdin:
    print(l[:-1].upper())

