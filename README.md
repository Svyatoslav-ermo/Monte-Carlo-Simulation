# Monte-Carlo-Simulation
The script contains two independent codes that employ Monte Carlo simulation. The first calculates the median of the people in a group required for any of their two birthdays to fall on the same week. The second uses Monte Carlo simulation to generate random walk of two particles until they collide or reach a threshold number of steps.

1. The Shared Birthday

1.1. Introduction

The goal of this problem is to write a Monte Carlo simulation to find the median number of people required in a group for the likelihood of any two of their birthdays occurring in the same week to be more than 50%. For each trial, the loop will start with a group of zero incrementing people with random birthdays into the group. A random birthday is assigned any value between 1 and 365, and each value is equally likely to occur. Once the match is found, the script will record the number of people in a group for each trial into the array. The script will output the median number of people, and a histogram will be plotted.

1.2. Model and Theory

It is assumed that a year has 365 days, and all birthdays are equally likely to occur. The birthdays are said to be in the same week if the absolute difference between two is less than 7 days. The year wraps around such that day 1 follows day 365. The absolute difference between two birthdays is found using the following equation: |Change in BD| = |BD1 - BD2| (#1)
Where:
• 𝐵𝐷1 and BD2 – birthdays of two people compared
Day 359 comes 7 days before day 1 (366-7). The absolute difference between day 359 and day 1 is 358. Day 360 is 6 days before day 1. The absolute difference between day 360 and day 1 is 359. Therefore, the following rule is used to determine if two birthdays occur in the same week. If absolute birthday difference between two people is less than 7 or greater than 358, then two birthdays occur in the same week.

1.3. Methods

To find if two birthdays occur in the same week, equation #1 will be applied. Before adding a new person to a group vector, the birthday of the new person will be subtracted from the group vector to give the vector of differences. The absolute value function will be used on the array to turn all negative differences positive. The minimum and maximum functions will be applied to the array of absolute differences to find the smallest and the largest differences, respectively.
