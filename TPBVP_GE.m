function [error] = TPBVP_GE(N)

%======================================================================
% This program does the following:
%  
% 1. It defines the matrix A and the left hand side f of 
%    the linear system AU = F that arises from the finite difference
%    discretization of the two-point boundary value problem.  
%
% 2. It then solves the linear system AU = F using Gaussian elimination 
%
%
% Input: 
%     N = number of intervals in the discretization
%
% Output: 
%      error = grid function norm of the difference between the exact 
%	       solution and the computed solution
%  
%=======================================================================
  
% m = number of interior points in the discretization
m = N-1;

% h = mesh step size
h=pi/(m+1);

% xi for i = 1,2...,m are the grid points in the discretization
xi=[h:h:m*h]';

% f is the left hand side of the linear system multiplied by h^2
f=-h^2*sin(xi);
f(m) = f(m)-pi;

% This part constructs the matrix A. Note that the 1/h^2 term in A has
% been moved to the right hand side and appears in f above.
e = ones(m,1);
A = -2*diag(e,0)+diag(e(2:m),-1)+diag(e(1:m-1),1);

% Call the function GEpivot to solve AU=F using Gaussian elimination
tic
[yi,lu,piv] = GEpivot(A,f);
toc

% plot the computed solution
plot(xi,yi,'--*');

% the exact solution
ei = xi+sin(xi);

%plot the exact solution on the same graph
hold on;
plot(xi,ei);

% Compute the grid function norm of the difference between the exact 
% solution at the grid points and the computed solution

error = sqrt(h)*norm(yi-ei);


