# -*- coding: utf-8 -*-
"""
Created on Fri Sep 27 16:06:29 2019

@author: disbrm1
"""

import math

def generate_possible_records(numgames):
    records = []
    for i in range(2**numgames):
        records.append(to_byte_arr(i, numgames))
        
    return records
        
def to_byte_arr(num, min_length = None):
    res = []
    
    if num == 0:
        if min_length == None:
            return [0]
        else:
            for i in range(min_length):
                res.append(0)
            return res
    
    bit_length = math.ceil(math.log2(num))+1
    
    if min_length == None:
        min_length = bit_length
        
    for i in range(bit_length):
        if (2**i) & num:
            bit = 1
        else:
            bit = 0
        res.append(bit)
        
    if len(res) < min_length:
        for i in range(min_length - len(res)):
            res.append(0)
    
    res.reverse()
    return res

def check_for_qualifying_record(record):
    wins_in_last_four_games = sum(record[:4])
    wins_in_last_eight_games = sum(record[:8])
    return wins_in_last_four_games == 2 and wins_in_last_eight_games == 4

def main():
    records = generate_possible_records(8)
    
    qualifying_records = [record for record in filter(check_for_qualifying_record, records)]
    
    print("The percentage of possibilities where they have won 2 of the last 4 and 4 of the last 8 games is " + "{:.5%}".format(len(qualifying_records)/len(records)))
    print("The relevant records are: ")
    for record in qualifying_records:
        print(record)
       
main()
    