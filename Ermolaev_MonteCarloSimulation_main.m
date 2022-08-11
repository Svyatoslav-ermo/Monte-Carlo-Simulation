%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title: Monte Carlo Simulation
%   Description: This script contains two Monte Carlo simulation applications.
%
%   The first code uses Monte Carlo simulation to calculate the median of
%   the people in a group required for any of their two birthdays to fall
%   on the same week. The script plots histogram of numbers of people in a
%   group for all trials of Monte Carlo simulation.
%
%   The second code uses Monte Carlo simulation to generate random walk of
%   two particles until they collide or reach a threshold number of steps.
%   The script visualizes random walk for the first trial by generating
%   time-updated plot for each step of particles. The script performs the
%   set amount of trials and displays the median number of steps before
%   collision.
%   
%   Author: Slava Ermolaev
%   Date: 07/29/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Clear Cache
clear all %#ok<*CLALL>
close all
clc
rng('shuffle') % Set random seed to current time

%%  List of problems
%=====================================================================
fprintf('Monte Carlo Simulation Problems\n\n')

fprintf('1: The Shared Birthday Problem\n')
fprintf('2: Random Walk Collisions\n')
choice = input('Make a selection:\n');
%=====================================================================
%%  Problems Switch
switch(choice)

    
%=====================================================================
    case(1)
       %%  Problem 1 - The Shared Birthday Problem
%--------------------------------------------------------------------%
       %   Set the number of trials
       numTrials = 1e4;

       %   Preallocate vector of zeros to hold
       %   num of people in a group for all trials.
       sameBDTrials = zeros(1, numTrials);

       %   For all trials
       for k = 1:1:numTrials
           %   Declare an empty vector of birthdays in a group
           groupBDs = [];

           %   Set random birthday in range [1, 365]
           randBD = ceil(365*rand);

           %   Set number of people to 1
           numPeople = 1;

           %   While two birthdays in the same weeek are not found
           while numPeople == 1 || ~(absMinDiff < 7 || absMaxDiff > 358)
               %   Add previously compared birthday to the group
               groupBDs(numPeople) = randBD;

               %   Set new random birthday
               randBD = ceil(365*rand);

               %   Increment numPeople in group
               numPeople = numPeople + 1;

               %   Calculate the absolute differences
               absMinDiff = min(abs(groupBDs - randBD));
               absMaxDiff = max(abs(groupBDs - randBD));

           end % End of while loop

           %   Add numPeople to sameBDTrials
           sameBDTrials(k) = numPeople;

       end % End of for loop for all trials

       %   Display the median of people in sameBDTrials rounded up to int
       fprintf('Median Number of People = %i\n', ceil(median(sameBDTrials)));

       %   Plot histogram of the number of people in groups
       figure(1)
       %   Find the number of bars to plot
       %diffMaxMinPeople = max(sameBDTrials) - min(sameBDTrials);
       histogram(sameBDTrials)
       grid on
       %   Set title
       title(['The Number of People in Groups With Two Birthdays in the Same Week for ' num2str(numTrials) ' trials'],'FontSize',24)
       %   Set axes labels
       xlabel('Number of People in a Group')
       ylabel('Number of Groups')
       % Set position on monitor
       set(gcf,'Position',[75 75 1275 600])
       % Set axes line width and font size
       set(gca,'LineWidth',3,'FontSize',20)
%=====================================================================
    case(2)
       %%  Problem 2 - Random Walk Collisions
%--------------------------------------------------------------------%
% Part a - See function rndMove
%--------------------------------------------------------------------%

       %   Set the number of trials
       numTrials = 5000;

       %   Set grid size
       grdSize = [11 11];

       %   Set probability value
       prob = 0.2;

       %   Set threshold value
       thrshld = 1000;

       %   Set array with numTrials zeros
       stepsArr = zeros(1,numTrials);

       %   Display the menu of choices
       fprintf('\nRandom Walk Conditions (PA - Particle A, PB - Particle B):\n')
       fprintf('1 - PA position (0,5), PB position (10,5). Both move\n')
       fprintf('2 - Same coordinates as 1. Only PA moves\n')
       fprintf('3 - PA position (1,5), PB position (9,5). Both move\n')
       fprintf('4 - Same coordinates as 3. Only PA moves\n')
       fprintf('5 - PA position (2,5), PB position (8,5). Both move\n')
       fprintf('6 - Same coordinates as 5. Only PA moves\n')
       fprintf('7 - PA position (4,5), PB position (5,5). Both move\n')
       fprintf('8 - Same coordinates as 7. Only PA moves\n')
       %   Input choice from user
       choice = input('Make a selection:\n');

       %   Start switch statement for setting initial conditions
       switch(choice)
%--------------------------------------------------------------------%
% Part b
%--------------------------------------------------------------------%
           case(1)
               initPos1 = [0 5];
               initPos2 = [10 5];
               method = 1;
%--------------------------------------------------------------------%
% Part c
%--------------------------------------------------------------------%
           case(2)
               initPos1 = [0 5];
               initPos2 = [10 5];
               method = 2;
%--------------------------------------------------------------------%
% Part d
%--------------------------------------------------------------------%
           case(3)
               initPos1 = [1 5];
               initPos2 = [9 5];
               method = 1;
           case(4)
               initPos1 = [1 5];
               initPos2 = [9 5];
               method = 2;
           case(5)
               initPos1 = [2 5];
               initPos2 = [8 5];
               method = 1;
           case(6)
               initPos1 = [2 5];
               initPos2 = [8 5];
               method = 2;
           case(7)
               initPos1 = [4 5];
               initPos2 = [5 5];
               method = 1;
           case(8)
               initPos1 = [4 5];
               initPos2 = [5 5];
               method = 2;
           otherwise % Invalid input
               error('Invalid choice, rerun script')
       end % End swtich statement

       %   Set current positions with initial positions
       prtclPos1 = initPos1;
       prtclPos2 = initPos2;

       %   Call function to plot random walkers for first trial. Return
       %   number of steps before collision
       numSteps = genPlot(prtclPos1, prtclPos2, prob, grdSize, thrshld, method);

       %   Store number of steps for first trial
       stepsArr(1) = numSteps;

       %   For all remaining trials
       for k = 2:1:numTrials

           %   Reset number of steps to 0
           numSteps = 0;

           %   Reset current positions with initial positions
           prtclPos1 = initPos1;
           prtclPos2 = initPos2;

           %   While there is no collision and number of steps is less than
           %   threshold value
           while ~(prtclPos1(1) == prtclPos2(1) && prtclPos1(2) == prtclPos2(2)) && (numSteps < thrshld)
               
               %   Call random move and update position for first particle
               prtclPos1 = rndMove(prtclPos1,prob,grdSize);

               %   If method is set to 1, call random move for second
               %   particle
               if method == 1
                   prtclPos2 = rndMove(prtclPos2,prob,grdSize);
               end % End if statement for particle 2

               %   Increment number of steps
               numSteps = numSteps + 1;

           end % End while loop for particle movement

           %   Store number of steps in k-th position of steps array
           stepsArr(k) = numSteps;

       end % End for loop for all trials

       %   Display median of steps rounded up to nearest integer
       fprintf('\nMedian = %i\n', ceil(median(stepsArr)))

%=====================================================================
    otherwise % If wrong input
        fprintf('\nInvalid choice. Please rerun the script.\n')
%=====================================================================
end % End switch