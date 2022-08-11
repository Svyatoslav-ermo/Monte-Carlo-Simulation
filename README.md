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

2. Random Walk Collisions

2.1. Introduction

The goal of this problem is to write a script that simulates two random walkers on an 11×11 grid with boundaries. The script will simulate random and equally likely movements or non-movements of particles in adjacent orthogonal directions. If collision between two particles is detected, the script will record the number of moves. The simulation will be repeated for a certain number of trials, if no collision will occur after a certain threshold, the threshold value will be recorded. The script will generate a time-updated plot of particles for 1 of the trials. The median number of trials rounded up to the nearest integer will be displayed.

2.2. Model and Theory

Particles A and B will start at (0, 5) and (10, 5), respectively, on an 11×11 grid. The numbering convention for a grid is the following. Origin starts with cell (0,0) in the lower-left corner. Coordinates increase in ascending order. First coordinate x increases to the right. Second coordinate y increases upward. Both particles will have a probability 𝑝𝑝=0.2 of moving either up, down, left, or right and 1−4𝑝𝑝=0.2 probability of staying in the same position. If a particle is near the border and probability results in a movement towards the border, the particles will stay put. Once two particles will occupy the same spot, collision will be detected, and the simulation will conclude. If both particles make 1,000 moves and do not collide, 1,000 steps will be recorded as collision.