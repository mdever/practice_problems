# -*- coding: utf-8 -*-
"""
Spyder Editor
This is a temporary script file.
"""

import sys
from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
from datetime import datetime


def make_change(amount, denoms, accum):
    """ Determines number of each coin to pay out for a given amount of change.
       For example, make_change(81, [25, 10, 5, 1], [0,0,0,0]) will return [3, 0, 1, 1] """
       
    if isinstance(accum, str):
        return accum
    if amount >= denoms[0]:
        accum[0] += 1
        return make_change(amount - denoms[0], denoms, accum)
    
    if amount >= denoms[1]:
        accum[1] += 1
        return make_change(amount - denoms[1], denoms, accum)
        
    if amount >= denoms[2]:
        accum[2] += 1
        return make_change(amount - denoms[2], denoms, accum)
        
    if amount >= denoms[3]:
        accum[3] += 1
        return make_change(amount - denoms[3], denoms, accum)
    
    if amount != 0:
        return "Cannot make change"
        
    
    return accum


def test_denoms(denoms):
    """ Computes the number of coins required to payout every amount of change from 1 to 99 cents """
    changes = []
    for i in range(1, 100):
        change = make_change(i, denoms, [0,0,0,0])
        if isinstance(change, str):
            return "Invalid"
        changes.append(sum(change))
    return changes

def score(change):
    """ This gives the weighted integral of the scores array.
    Sums all the individual scores and divides by 99 to give average number of coins used with the coin scheme. """
    if isinstance(change, str):
        return sys.maxsize
    return sum(change)/len(change)


def make_permutations(max_coin_size):
    """ Makes all coin schemes we're interested in testing up to a certain max coin size. """
    if max_coin_size < 4:
        return "Give me a break buddy!"
    perms = []
    for i in range(max_coin_size, 3, -1):
        for j in range(max_coin_size-1, 2, -1):
            for k in range(max_coin_size-2, 1, -1):
                for l in range(max_coin_size-3, 0, -1):
                    perms.append([i, j, k, l])
                    
    return perms

# Just a helper method to find the minimum value and index in an array.
# find_min([5, 2, 7, 3, 1, 5]) will return (4, 1)
def find_min(lis):
    res = [-1, sys.maxsize]
    for i in range(len(lis)):
        if lis[i] < res[1]:
            res[0] = i
            res[1] = lis[i]
            
    return res
        
# Here is the program, essentially
def main():
    start_time = datetime.now()
    all_perms = make_permutations(99)
    scores = []
    i = 0
    for perm in all_perms:
        i = i+1
        if i % 100 == 0:
            print("On trial", i) # Just give some indication of progress
        scores.append(score(test_denoms(perm)))
    
    index, the_score = find_min(scores)
    # index = 140,969
    # score = 4.1414...
    
    winning_permutation = all_perms[index]
    # winning_permutation = [38, 11, 3, 1]
    
    print("Ideal change denominations are %s with an average coin usage of %s per transaction" % (winning_permutation, the_score))
    
    end_time = datetime.now()
    print(start_time)
    print(end_time)
    elapsed_ms = (end_time - start_time)
    print("Elapsed time:", elapsed_ms)
