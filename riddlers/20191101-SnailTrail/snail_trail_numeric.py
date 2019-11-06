#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov  4 23:24:23 2019

@author: rk
"""

import numpy as np
import matplotlib.pyplot as plt
from numpy import linalg as LA

A = np.array([[-1,  1,  0,  0,  0,  0],
              [ 0, -1,  1,  0,  0,  0],
              [ 0,  0, -1,  1,  0,  0],
              [ 0,  0,  0, -1,  1,  0],
              [ 0,  0,  0,  0, -1,  1],
              [ 1,  0,  0,  0,  0, -1]])


r, eta = LA.eig(A)

x_0 = np.array([0, 1*10, (3*10)/2, 10, 0, -10/2])
y_0 = np.array([0, 0, 10*-np.sqrt(3)/2, 10*-np.sqrt(3), 10*-np.sqrt(3), 10*-np.sqrt(3)/2])

ev_A = eta

c_x = LA.solve(ev_A, x_0)
c_y = LA.solve(ev_A, y_0)

t = np.linspace(0, 10000, 1000000)

x0 = ev_A[0,0] * c_x[0] * np.exp(r[0]*t) + ev_A[0, 1] * c_x[1] * np.exp(r[1]*t) + \
     ev_A[0,2] * c_x[2] * np.exp(r[2]*t) + ev_A[0, 3] * c_x[3] * np.exp(r[3]*t) + \
     ev_A[0,4] * c_x[4] * np.exp(r[4]*t) + ev_A[0, 5] * c_x[5] * np.exp(r[5]*t)
     
y0 = ev_A[0,0] * c_y[0] * np.exp(r[0]*t) + ev_A[0, 1] * c_y[1] * np.exp(r[1]*t) + \
     ev_A[0,2] * c_y[2] * np.exp(r[2]*t) + ev_A[0, 3] * c_y[3] * np.exp(r[3]*t) + \
     ev_A[0,4] * c_y[4] * np.exp(r[4]*t) + ev_A[0, 5] * c_y[5] * np.exp(r[5]*t)
     
x1 = ev_A[1,0] * c_x[0] * np.exp(r[0]*t) + ev_A[1, 1] * c_x[1] * np.exp(r[1]*t) + \
     ev_A[1,2] * c_x[2] * np.exp(r[2]*t) + ev_A[1, 3] * c_x[3] * np.exp(r[3]*t) + \
     ev_A[1,4] * c_x[4] * np.exp(r[4]*t) + ev_A[1, 5] * c_x[5] * np.exp(r[5]*t)
     
y1 = ev_A[1,0] * c_y[0] * np.exp(r[0]*t) + ev_A[1, 1] * c_y[1] * np.exp(r[1]*t) + \
     ev_A[1,2] * c_y[2] * np.exp(r[2]*t) + ev_A[1, 3] * c_y[3] * np.exp(r[3]*t) + \
     ev_A[1,4] * c_y[4] * np.exp(r[4]*t) + ev_A[1, 5] * c_y[5] * np.exp(r[5]*t)
     
x2 = ev_A[2,0] * c_x[0] * np.exp(r[0]*t) + ev_A[2, 1] * c_x[1] * np.exp(r[1]*t) + \
     ev_A[2,2] * c_x[2] * np.exp(r[2]*t) + ev_A[2, 3] * c_x[3] * np.exp(r[3]*t) + \
     ev_A[2,4] * c_x[4] * np.exp(r[4]*t) + ev_A[2, 5] * c_x[5] * np.exp(r[5]*t)
     
y2 = ev_A[2,0] * c_y[0] * np.exp(r[0]*t) + ev_A[2, 1] * c_y[1] * np.exp(r[1]*t) + \
     ev_A[2,2] * c_y[2] * np.exp(r[2]*t) + ev_A[2, 3] * c_y[3] * np.exp(r[3]*t) + \
     ev_A[2,4] * c_y[4] * np.exp(r[4]*t) + ev_A[2, 5] * c_y[5] * np.exp(r[5]*t)
     
x3 = ev_A[3,0] * c_x[0] * np.exp(r[0]*t) + ev_A[3, 1] * c_x[1] * np.exp(r[1]*t) + \
     ev_A[3,2] * c_x[2] * np.exp(r[2]*t) + ev_A[3, 3] * c_x[3] * np.exp(r[3]*t) + \
     ev_A[3,4] * c_x[4] * np.exp(r[4]*t) + ev_A[3, 5] * c_x[5] * np.exp(r[5]*t)
     
y3 = ev_A[3,0] * c_y[0] * np.exp(r[0]*t) + ev_A[3, 1] * c_y[1] * np.exp(r[1]*t) + \
     ev_A[3,2] * c_y[2] * np.exp(r[2]*t) + ev_A[3, 3] * c_y[3] * np.exp(r[3]*t) + \
     ev_A[3,4] * c_y[4] * np.exp(r[4]*t) + ev_A[3, 5] * c_y[5] * np.exp(r[5]*t)
 
x4 = ev_A[4,0] * c_x[0] * np.exp(r[0]*t) + ev_A[4, 1] * c_x[1] * np.exp(r[1]*t) + \
     ev_A[4,2] * c_x[2] * np.exp(r[2]*t) + ev_A[4, 3] * c_x[3] * np.exp(r[3]*t) + \
     ev_A[4,4] * c_x[4] * np.exp(r[4]*t) + ev_A[4, 5] * c_x[5] * np.exp(r[5]*t)
     
y4 = ev_A[4,0] * c_y[0] * np.exp(r[0]*t) + ev_A[4, 1] * c_y[1] * np.exp(r[1]*t) + \
     ev_A[4,2] * c_y[2] * np.exp(r[2]*t) + ev_A[4, 3] * c_y[3] * np.exp(r[3]*t) + \
     ev_A[4,4] * c_y[4] * np.exp(r[4]*t) + ev_A[4, 5] * c_y[5] * np.exp(r[5]*t)
     
x5 = ev_A[5,0] * c_x[0] * np.exp(r[0]*t) + ev_A[5, 1] * c_x[1] * np.exp(r[1]*t) + \
     ev_A[5,2] * c_x[2] * np.exp(r[2]*t) + ev_A[5, 3] * c_x[3] * np.exp(r[3]*t) + \
     ev_A[5,4] * c_x[4] * np.exp(r[4]*t) + ev_A[5, 5] * c_x[5] * np.exp(r[5]*t)
     
y5 = ev_A[5,0] * c_y[0] * np.exp(r[0]*t) + ev_A[5, 1] * c_y[1] * np.exp(r[1]*t) + \
     ev_A[5,2] * c_y[2] * np.exp(r[2]*t) + ev_A[5, 3] * c_y[3] * np.exp(r[3]*t) + \
     ev_A[5,4] * c_y[4] * np.exp(r[4]*t) + ev_A[5, 5] * c_y[5] * np.exp(r[5]*t)
    
x0_real = np.real(x0)
y0_real = np.real(y0)

x1_real = np.real(x1)
y1_real = np.real(y1)

x2_real = np.real(x2)
y2_real = np.real(y2)

x3_real = np.real(x3)
y3_real = np.real(y3)

x4_real = np.real(x4)
y4_real = np.real(y4)

x5_real = np.real(x5)
y5_real = np.real(y5)


length = 0
for i in range(len(x0)-1):
    delta_x = x0_real[i+1] - x0_real[i]
    delta_y = y0_real[i+1] - y0_real[i]
    length += np.sqrt(delta_x**2 + delta_y**2)

plt.xlim((-10, 20))
plt.ylim((-20, 3))
plt.plot([0,  10], [0,                 0],               'k-')
plt.plot([10, 15], [0,                -10*np.sqrt(3)/2], 'k-')
plt.plot([15, 10], [-10*np.sqrt(3)/2, -10*np.sqrt(3)],   'k-')
plt.plot([10,  0], [-10*np.sqrt(3),   -10*np.sqrt(3)],   'k-')
plt.plot([ 0, -5], [-10*np.sqrt(3),   -10*np.sqrt(3)/2], 'k-')
plt.plot([-5,  0], [-10*np.sqrt(3)/2,   0],              'k-')
plt.text(12, 1, "Length=" + str(length))
plt.plot(x0_real, y0_real)
plt.plot(x1_real, y1_real)
plt.plot(x2_real, y2_real)
plt.plot(x3_real, y3_real)
plt.plot(x4_real, y4_real)
plt.plot(x5_real, y5_real)

