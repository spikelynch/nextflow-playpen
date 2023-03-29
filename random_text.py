#!/usr/bin/env python

# this generates some random text and dumps it to stdout

from random import choice

ALPHA = "abcdefghijklmnopqrstuvwxyz"

for i in range(10):
    chars = [ choice(ALPHA) for i in range(70) ]
    print("".join(chars))