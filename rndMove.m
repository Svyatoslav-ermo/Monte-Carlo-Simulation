%--------------------------------------------------------------------%
% Part a
%--------------------------------------------------------------------%

function [newPos] = rndMove(oldPos,prob,grdSize)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Definition of rndMove function.
%--------------------------------------------------------------------%
%   Function accepts old position of a particle, probability value, and
%   grid size. Function updates particle's position after its orthogonal
%   movement in one out of four directions based on probability value.
%   Particle has 1-4*prob probability of staying still. If particle tries
%   to move past boundaries, particle remains still. Convention for grid
%   size is (0,0) in the lower left corner, with x increasing to the right,
%   and y increasing up.
%
%   Name: Slava Ermolaev
%   UID: 005543860
%   Date: 7/29/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   Error check that grid size is not 0 or negative
if sum(grdSize <= [0 0])
    error('Error: Grid cannot have negative size or size of 0\n')
end % End grid size check

%   Error check particle position is within grid
if sum(oldPos >= grdSize) || sum(oldPos < [0 0])
    error('Error: Particle is out of bounds of the grid\n')
end % End bounds check

%   Error check that probability value is within the range [0, 0.25]
if prob < 0 || prob > 0.25
    error('Error: Probability value must be within the range [0, 25]\n')
end % End prob value check

%   Generate random number from 0 to 1
r = rand();

%   Set newPos to 1x2 array of zeros
newPos = zeros(1,2);

%   If r is less than or equal to prob, and particle is not adjacent to
%   upper wall
if (r <= prob) && (oldPos(2) ~= grdSize(2)-1)
    %   Move up
    newPos(1) = oldPos(1);
    newPos(2) = oldPos(2) + 1;

%   Else if r is less than or equal to 2*prob and particle is not adjacent
%   to right wall
elseif (r <= 2*prob) && (oldPos(1) ~= grdSize(1)-1)
    %   Move right
    newPos(1) = oldPos(1)+1;
    newPos(2) = oldPos(2);

%   Else if r is less than or equal to 3*prob and particle is not adjacent
%   to lower wall
elseif (r <= 3*prob) && (oldPos(2) ~= 0)
    %   Move down
    newPos(1) = oldPos(1);
    newPos(2) = oldPos(2) - 1;

%   Else if r is less than or equal to 4*prob and particle is not adjacent
%   to left wall
elseif (r <= 4*prob) && (oldPos(1) ~= 0)
    %   Move left
    newPos(1) = oldPos(1) - 1;
    newPos(2) = oldPos(2);

%   Else stay put
else
    newPos = oldPos;

end % End if statement

end % End of rndMove