function [error] = TPBVP_Doo(N)
  
%=========================================================================
% This program does the following:
%  1. It defines the matrix A and the left hand side f of the linear
% system AU = F that arises from the finite difference discretization of the
% two-point boundary value problem. 
%
%  2. The matrix A is defined by constructing vectors a b and c that
%  contain the elements of the subdiagonal, diagonal and superdiagonal of
%  A respectively. 
%  
%  3. Once these have been constructed the program "tridiag.m" is invoked to
%  solve the system using the Doolittle algorithm.  
%  
%  
%  Input: 
%    N = number of intervals in the discretization 
%  
%  Output: 
%   error = grid function norm of the difference between the exact
%                 solution and the computed solution 
%=========================================================================

% m = number of interior points in the discretization
m = N-1;

% h = mesh step size
h=pi/(m+1);

% xi for i = 1,2...,m are the grid points in the discretization
xi=[h:h:m*h]';

% f is the left hand side of the linear system multiplied by h^2
f=-h^2*sin(xi);
f(m) = f(m)-pi;


% This part constructs three vectors
%
%  vector a: contains the elements of the subdiagonal of the matrix A
%  vector b: contains the elements of the diagonal of the matrix A
%  vector a: contains the elements of the superdiagonal of the matrix A
%

a = ones(m,1);
b = -2*ones(m,1);
c = ones(m,1);

% Call the function tridiag to solve the linear system AU=F using the
% Doolittle method applied to the tridiagonal system. This solve will be
% much faster than Gaussian elimination.
% Also, use tic-toc to time the run

tic
[Ui, alpha, beta, ier] = tridiag(a,b,c,f,m,0);
toc

% Do this again with the value of iflag = 1 and notice the change in the runtime.

tic
[Ui, alpha, beta, ier] = tridiag(alpha,beta,c,f,m,1);
toc


% plot the computed solution
plot(xi,Ui,'--*');

% the exact solution
ei = xi+sin(xi);

%plot the exact solution on the same graph
hold on;
plot(xi,ei);

% Compute the grid function norm of the difference between the exact 
% solution at the grid points and the computed solution

error = sqrt(h)*norm(Ui-ei);


