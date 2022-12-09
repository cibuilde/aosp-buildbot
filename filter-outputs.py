#!/usr/bin/env python3
import sys
with open('out/soong/module-info.txt') as f:
    context = f.read()
    outputs = []
    for str in sys.argv:
        if str in context:
            outputs.append(str)
    print(' '.join(outputs))
