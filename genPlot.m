function numSteps = genPlot(prtclPos1, prtclPos2, prob, grdSize, thrshld, method)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Definition of genPlot function.
%--------------------------------------------------------------------%
%   Function accepts two particles' positions, probability value, grid
%   size, threshold value, and method. Method can be either 1 or 2. If
%   method is 1, function calls rndMove function for both particles. If
%   method is 2, function calls rndMove function for only prtclPos1,
%   prtclPos2 remains unchanged. Function calls rndMove and plots particles
%   on a predefined grid continuously until both particles collide, that is
%   take the same position, or until threshold number of steps has been
%   reached. Function returns number of steps taken before collision or
%   threshold value.
%
%   Name: Slava Ermolaev
%   UID: 005543860
%   Date: 7/29/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   Error check that grid size is not 0 or negative
if sum(grdSize <= [0 0])
    error('Error: Grid cannot have negative size or size of 0\n')
end % End grid size check

%   Error check particle 1 position is within grid
if sum(prtclPos1 >= grdSize) || sum(prtclPos1 < [0 0])
    error('Error: Particle is out of bounds of the grid\n')
end % End bounds check

%   Error check particle 2 position is within grid
if sum(prtclPos2 >= grdSize) || sum(prtclPos2 < [0 0])
    error('Error: particle is out of bounds of the grid\n')
end % End bounds check

%   Error check that probability value is within the range [0, 0.25]
if prob < 0 || prob > 0.25
    error('Error: Probability value must be within the range [0, 25]\n')
end % End prob value check

%   Error check that threshold is not negative
if thrshld < 0
    error('Error: Threshold value cannot be zero\n')
end % End thrshld check

%   Error check that method is either 1 or 2
if method ~= 1 && method ~= 2
    error('Error: Method can only be either 1 or 2\n')
end % End method check

%   Set number of steps to 0
numSteps = 0;

%   Set bounds for grids
xBounds = [-0.5 grdSize(1)-0.5];
yBounds = [-0.5 grdSize(1)-0.5];

%   Create set of coordinates for grids
verGrids = linspace(0.5,grdSize(1)-1.5,grdSize(1)-1);
horGrids = linspace(0.5,grdSize(2)-1.5,grdSize(2)-1);

%--------------------------------------------------------------------%
% Plotting initial positions
%--------------------------------------------------------------------%

figure(1) % Set figure 1 for the plot

%   Erase previous particles
hold off

%   Plot first particle
plot(prtclPos1(1),prtclPos1(2),'bo','MarkerFaceColor','b','MarkerSize',20)
%   Hold on to first particle
hold on
%   Plot second particle
plot(prtclPos2(1),prtclPos2(2),'ro','MarkerFaceColor','r','MarkerSize',20)

%   Set equal aspect ratio
axis equal
%   Draw horizontal grids
for k=1:1:10
    line(xBounds, [horGrids(k) horGrids(k)])
end % End drawing horizontal grids

%   Draw vertical grids
for k=1:1:10
    line([verGrids(k) verGrids(k)], yBounds)
end % End drawing vertical grids

title('Random Walk Time-updated Plot','FontSize',24)
%   Set text
text(floor(grdSize(1)/2-1),grdSize(2)-1,['Step = ' num2str(numSteps)],'FontSize',20)
text(floor(grdSize(1)/2-4),grdSize(2)-2,'Press any key to start simulation','FontSize',20)
xlim([-0.5 grdSize(1)-0.5]) % Set limits of x axis
ylim([-0.5 grdSize(2)-0.5]) % Set limits of y axis
%   Set screen position and figure size
set(gcf,'Position',[75 75 1275 600])
%   Format axes lengths and label fonts
set(gca,'LineWidth',3,'FontSize',20)
xlabel('X axis')
ylabel('Y axis')

%   Pause until user input
pause

%--------------------------------------------------------------------%
% Plotting time-updated plot of all positions
%--------------------------------------------------------------------%

%   While first and second particles did not collide and number of steps is
%   less than threshold
while ~(prtclPos1(1) == prtclPos2(1) && prtclPos1(2) == prtclPos2(2)) && (numSteps < thrshld)
    %   Call rndMove for first particle
    prtclPos1 = rndMove(prtclPos1,prob,grdSize);
    
    %   If method is 1
    if method == 1
        %   Call rndMove for second particle
        prtclPos2 = rndMove(prtclPos2,prob,grdSize);
    end % End if
    
    %   Increment number of steps
    numSteps = numSteps + 1;

    %   Plot two points on the grid of size grdSize
    figure(1) % Set figure 1 for the plot

    hold off
    %   Plot first particle
    plot(prtclPos1(1),prtclPos1(2),'bo','MarkerFaceColor','b','MarkerSize',20)
    hold on
    %   Plot second particle
    plot(prtclPos2(1),prtclPos2(2),'ro','MarkerFaceColor','r','MarkerSize',20)
    %   Set equal aspect ratio
    axis equal
    %   Draw horizontal grids
    for k=1:1:10
        line(xBounds, [horGrids(k) horGrids(k)])
    end % End drawing horizontal grids

    %   Draw vertical grids
    for k=1:1:10
        line([verGrids(k) verGrids(k)], yBounds)
    end % End drawing vertical grids

    %     xticks(xTickVals)
    %     yticks(yTickVals)
    title('Random Walk Time-updated Plot','FontSize',24)
    %   Set text
    text(floor(grdSize(1)/2)-1,grdSize(2)-1,['Step = ' num2str(numSteps)],'FontSize',20)
    xlim([-0.5 grdSize(1)-0.5]) % Set limits of x axis
    ylim([-0.5 grdSize(2)-0.5]) % Set limits of y axis
    %   Set screen position and figure size
    set(gcf,'Position',[75 75 1275 600])
    %   Format axes lengths and label fonts
    set(gca,'LineWidth',3,'FontSize',20)
    xlabel('X axis')
    ylabel('Y axis')

    %   Pause for 10 milliseconds
    pause(0.01)
end % End while loop

end % End of genPlot