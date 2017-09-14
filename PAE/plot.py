#!/usr/bin/python
import matplotlib.pyplot as plt
import sys

def plot_sorted(dictionary):
	mykeys = sorted(dictionary.keys())
	mydata = []
	for key in mykeys:
		mydata.append(dictionary[key])
	plt.plot(mykeys,mydata,"r.")
	plt.show()

data = {}
inputData = sys.stdin.readlines()
for line in inputData:
	[count, value] =  line.split()
	data[int(value)] = int(count)

plot_sorted(data)