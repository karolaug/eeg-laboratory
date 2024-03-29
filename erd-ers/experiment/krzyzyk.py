#!/usr/bin/python -u

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Author:
#     Karol Augustin <karol@augustin.pl>
# git repository: http://git.nimitz.pl

'''
Fire with -u switch,
python -u filename.py
'''

import time
import sys
import numpy as np

#ile = int(sys.argv[1])
ile = 60
sys.stdout.write("\n\n\n\n")
sys.stdout.write("           ")
time.sleep(15)
for i in range(ile):
    time.sleep(13+np.random.random(1)*2)
    sys.stdout.write("\rXXXXXXXXXXX")
    time.sleep(2)
    sys.stdout.write("\r           ")

time.sleep(5)
sys.stdout.write("\n")


