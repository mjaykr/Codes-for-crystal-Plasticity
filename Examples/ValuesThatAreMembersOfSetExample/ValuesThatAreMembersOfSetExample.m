%% Values That Are Members of Set
% Create two vectors with values in common.

% Copyright 2015 The MathWorks, Inc.

A = [5 3 4 2]; 
B = [2 4 4 4 6 8];

%%
% Determine which elements of |A| are also in |B|.
Lia = ismember(A,B)

%%
% |A(3)| and |A(4)| are found in |B|.
