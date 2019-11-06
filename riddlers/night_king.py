# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
import numpy as np

results = np.full((100, 100), None)

def win_percentage(living, dead):
    if results[living, dead] != None:
        return results[living, dead]
    
    if living == 0 and dead > 0:
        res = 0
    elif living > 0 and dead == 0:
        res = 1
    elif living == 1 and dead == 1:
        res =  1/2
    else:
        res = (1/2)*(win_percentage(living, dead-1) + win_percentage(living-1, dead+1))
    
    results[living, dead] = res
    return res
    


print(win_percentage(10, 10))

print(win_percentage(9, 9))
