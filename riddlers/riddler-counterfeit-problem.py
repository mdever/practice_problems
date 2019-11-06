#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Aug 31 23:30:56 2019

@author: mark

From https://fivethirtyeight.com/features/can-you-fool-the-bank-with-your-counterfeit-bills/

"""

from itertools import combinations
from fractions import Fraction
from math import ceil

from matplotlib import pyplot as plt

PROBABILITY_OF_DETECTION = Fraction(1/4)

def make_combinator():
    previous_results = dict()
    def all_combinations(n, k):
        if n in previous_results:
            return previous_results[n]
        result = [combo for combo in combinations([i for i in range(1, n+1)], k)]
        previous_results[n] = result
        return result

    return all_combinations

all_combinations = make_combinator()

def bad_draw_probability(total, counterfeit, drawn, result_type='count'):
    combos = all_combinations(total, drawn)  # (1, 2, 3), (1, 2, 4), ...
    total_combos = len(combos)
    candidates = set([i for i in range(1, counterfeit+1)]) # {1, 2, 3, 4}

    count = dict()
    for i in range(drawn+1):
        count[i] = 0
        
    for combo in combos:
        combo = set(combo)
        number_of_frauds = len(candidates.intersection(combo))
        count[number_of_frauds] += 1
        
        
    if result_type == 'prob':
        for i in range(drawn+1):
            count[i] = float(count[i])/float(total_combos)
    elif result_type == 'fraction':
        for i in range(drawn+1):
            count[i] = Fraction(count[i]/total_combos)
    
    return count

def probability_of_discovery(frauds_drawn):
    return 1 - (1 - PROBABILITY_OF_DETECTION)**frauds_drawn
    
def expected_bank_account(numreal, numfake):
    number_of_cards_drawn = ceil(0.05*(numreal+numfake))
    odds_of_draw = bad_draw_probability(numreal+numfake, numfake, number_of_cards_drawn, result_type='fraction')
    chance_of_discovery = 0
    for k in odds_of_draw:
        chance_of_discovery += probability_of_discovery(k) * odds_of_draw[k]
        
    chance_of_success = 1-chance_of_discovery
    return float(((numreal+numfake)*100)*chance_of_success)
        

xs = [i for i in range(50)]

E_deposit = []
for i, x in enumerate(xs):
    E_deposit.append(expected_bank_account(25, x))

plt.figure()
plt.plot(E_deposit)
plt.show()