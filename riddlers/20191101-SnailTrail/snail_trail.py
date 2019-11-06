#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Nov  3 19:39:12 2019

@author: mark
"""

from sympy import *

A = Matrix([[-1,  1,  0,  0,  0,  0],
            [ 0, -1,  1,  0,  0,  0],
            [ 0,  0, -1,  1,  0,  0],
            [ 0,  0,  0, -1,  1,  0],
            [ 0,  0,  0,  0, -1,  1],
            [ 1,  0,  0,  0,  0, -1]])

x0 = Matrix([0, 
      1,
      3/2,
      1,
      0,
      -1/2])

y0 = Matrix([0,
      0,
      -sqrt(3)/2,
      -sqrt(3),
      -sqrt(3),
      -sqrt(3)/2])

evs = A.eigenvects()

ev0 = [evs[0][2][0][i] for i in range(6)]
ev1 = [evs[1][2][0][i] for i in range(6)]
ev2 = [evs[2][2][0][i] for i in range(6)]
ev3 = [evs[3][2][0][i] for i in range(6)]
ev4 = [evs[4][2][0][i] for i in range(6)]
ev5 = [evs[5][2][0][i] for i in range(6)]

wronsk = Matrix([ev0, ev1, ev2, ev3, ev4, ev5]).transpose()
inv_wronsk = wronsk.inv()

c_x = inv_wronsk.multiply(x0)
c_y = inv_wronsk.multiply(y0)

c_x_f = [c.evalf(chop=True) for c in c_x]
c_y_f = [c.evalf(chop=True) for c in c_y]

x_t = wronsk.multiply(Matrix(c_x_f))


