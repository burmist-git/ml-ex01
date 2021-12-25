%
%06
%
A = [3,4;2,16]
A_ = pinv(A)
A*A_
A_*A

%
%07
%
% Initialize matrix A 
A = [1,2,0;0,5,6;7,0,9]

% Transpose A 
A_trans = A' 

% Take the inverse of A 
A_inv = inv(A)

% What is A^(-1)*A? 
A_invA = inv(A)*A
