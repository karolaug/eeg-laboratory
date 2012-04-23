
#Fire with -u switch,
#python -u filename.py

import time
import sys
import numpy as np

ile = 10
sys.stdout.write("\n\n\n\n")
sys.stdout.write(" ")
for i in range(ile):
    time.sleep(13+np.random.random(1)*2)
    sys.stdout.write("\rX")
    time.sleep(2)
    sys.stdout.write("\r ")


sys.stdout.write("\n")
