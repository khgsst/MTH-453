function [errv,errvh,errvk] = lap2d_gs(m,maxiter,tol)
%=======================================================================
% This code solves the Laplace problem using the Gauss-Seidel method on a 
%  (m+2) x (m+2) grid with an m x m grid of unknowns and h = 1/(m+1)
%
% Inputs:
%      m = number of interior gridpoints along each axis
%      maxiter = max number of iterations allowed for iterative method 
%
% Outputs:
%      plots exact, direct and iterative solutions
%      returns ERRV, a vector of inf-norm errors vs exact solution
%      returns ERRVH, a vector of inf-norm errors vs direct solution
%
%=======================================================================  

% Notes:
%  - Use the 'help' command in MATLAB to figure out what the command
%    'reshape' does. 
%
%  - Use 'help' to figure out what 'numgrid' and 'delsq' do. 
%
%  - Use 'help mldivide' to understand the direct solve 'A\b'. 
%
%  - Uncomment the 'while' statement to add a stopping criteria.

  
%Set up the grid  
h = 1/(m+1);
x = 0:h:1;
y = 0:h:1;
[X,Y] = meshgrid(x,y);

%==============Exact Solution================================ 
ue = (sin(pi*X).*sinh(pi*Y))./sinh(pi);
% plot solution
figure(1)
subplot(3,1,1)
surf(X,Y,ue);
axis('tight')
title('exact')


%==============Direct Method================================ 
uhs=zeros(m+2);
uhs(m+2,:) = sin(pi*x);
% create right-hand-side vector with boundary values
b=reshape(uhs(3:m+2,2:m+1),m^2,1);
% create the 5-pt stencil matrix
A=delsq(numgrid('S',m+2));
% solve system using sparse lu-factorization and backsubstitution 
uhsv=A\b;
% add computed values to solution
uhs(2:m+1,2:m+1)=reshape(uhsv,m,m);
% plot solution
figure(1)
subplot(3,1,2)
surf(X,Y,uhs);
axis('tight')
title('direct')


%==============Gauss-Seidel Method================================ 
% assign size to the iterative solution and let it contain all zeros 
uhn=zeros(m+2);

% assign the boundary condition
uhn(m+2,:) = sin(pi*x);

%define a new temp vector and assign it all zero values
unew = uhn;

%counter for number of iterations
iter = 0;

%define an error tolerance (for stopping criteria)
tol=eps;

%define the error to be some arbitrary large number > tol
err = 1;

tic
while (err > tol) && (iter <=maxiter)
  for j =2:(m+1)
    for i = 2:(m+1)
      uhn(i,j) = 0.25*(uhn(i-1,j)+uhn(i+1,j)+uhn(i,j-1)+uhn(i,j+1));
    end 
  end
  iter = iter +1;
  
  %compute the infinity norm for the global error
  err = norm(reshape(ue-uhn,(m+2)^2,1),inf);
  errv(iter) = err;

  %compute the error between direct and iterative solutions 
  errvh(iter) = norm(reshape(uhs-uhn,(m+2)^2,1),inf);

  %compute the error between direct and exact solutions 
  errvk(iter) = norm(reshape(uhs-ue,(m+2)^2,1),inf);
end
toc

% plot the solution obtained using the iterative method
figure(1)
subplot(3,1,3)
surf(X,Y,uhn);
axis('tight')
title('Gauss-Seidel')