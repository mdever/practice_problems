# -*- coding: utf-8 -*-
"""
Created on Mon Apr  8 15:51:26 2019

@author: disbrm1
"""

import numpy as np
import matplotlib.pyplot as plt

def predator_prey(duration, timestep, x0, y0, **kwargs):
    if 'A' in kwargs:
        A = kwargs['A']
    else:
        A = 1.0
        
    if 'B' in kwargs:
        B = kwargs['B']
    else:
        B = 1.0
        
    if 'C' in kwargs:
        C = kwargs['C']
    else:
        C = 1.0
        
    if 'D' in kwargs:
        D = kwargs['D']
    else:
        D = 1.0
        
    t = np.arange(0, duration, timestep)
    x = np.zeros(len(t))
    y = np.zeros(len(t))
    
    x[0] = x0
    y[0] = y0
    
    for i in range(1, len(t)):
        x[i] = max(0, timestep*(A*x[i-1] - B*x[i-1]*y[i-1]) + x[i-1])
        y[i] = max(0, timestep*(C*x[i-1]*y[i-1] - D*y[i-1]) + y[i-1])
        
    return [t, x, y]