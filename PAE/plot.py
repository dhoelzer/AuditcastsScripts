#!/usr/bin/python
import matplotlib.pyplot as plt
import numpy as numpy
import sys


dictionary = {}
inputData = sys.stdin.readlines()
for line in inputData:
	[count, value] =  line.split()
	dictionary[int(value)] = int(count)

keys = sorted(dictionary.keys())
data = []
for key in keys:
	data.append(dictionary[key])

ax=plt.axes()
ax.plot(keys, data, ".")

min = min(data)
max = max(data)
stddev = numpy.std(data)
mean = numpy.mean(data)

fudge = 2
if(len(sys.argv) > 1):
	fudge = int(sys.argv[1])

for key in keys:
	if (dictionary[key] >= (mean + (fudge*stddev))):
		ax.annotate(str(key), (key, dictionary[key]), rotation=45)
plt.show()		
