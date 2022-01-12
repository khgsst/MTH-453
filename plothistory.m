


% call Jacobi method with m=7 and 500 iterations:
[Jerrv,Jerrvh]=lap2d_jacobi(7,500);

% The following plots the convergence history of the Jacobi method using
% logarithmic scaling for the error between the exact and iterative
% solutions. 
figure(2)
it = 1:length(Jerrv);
plot(it,log2(Jerrv),'r--')
hold on;

% The following plots the convergence history of the Jacobi method using
% logarithmic scaling for the error between the direct and iterative
% solutions. 
figure(3)
it = 1:length(Jerrvh);
plot(it,log2(Jerrvh),'r--')
hold on;



% call Jacobi method with m=15 and 500 iterations:
[Jerrv,Jerrvh]=lap2d_jacobi(15,500);

% The following plots the convergence history of the Jacobi method using
% logarithmic scaling for the error between the exact and iterative
% solutions.
figure(2)
it = 1:length(Jerrv);
plot(it,log2(Jerrv),'b-')
hold on;

% The following plots the convergence history of the Jacobi method using
% logarithmic scaling for the error between the direct and iterative
% solutions. 
figure(3)
it = 1:length(Jerrvh);
plot(it,log2(Jerrvh),'b-')
hold on;



% add title, labels, and legends to the above plots
figure(2)
title('Error between iterative solution and exact solution')
xlabel('Iteration number')
ylabel('log_2(error)')
legend('m=7','m=15');

figure(3)
title('Error between iterative solution and direct solution')
xlabel('Iteration number')
ylabel('log_2(error)')
legend('m=7','m=15');

