#!/usr/bin/env python3

import matplotlib.pyplot as plt

if __name__ == '__main__':
  fileName = 'output.txt'
  f = open(fileName)
  data = []
  for line in f:
    data.append(int(line))
  plt.hist(data, bins=(max(data)-min(data)+1))
  plt.show()