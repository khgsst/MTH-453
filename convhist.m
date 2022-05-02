% call methods with m=7 and 500 iterations:
[Jerrv]=lap2d_jacobi(7,500,eps);
[Gerrv]=lap2d_gs(7,500,eps);
[Serrv]=lap2d_sor(7,500,eps);

% The following plots the convergence history of the methods using
% logarithmic scaling for the error between the exact and iterative
% solutions. 
figure(2)
it = 1:length(Jerrv);
plot(it,log2(Jerrv),'r--')
hold on;
plot(it,log2(Gerrv),'b--')
plot(it,log2(Serrv),'g--')
hold off;

% call methods with m=15 and 500 iterations:
[Jerrv]=lap2d_jacobi(15,500,eps);
[Gerrv]=lap2d_gs(15,500,eps);
[Serrv]=lap2d_sor(15,500,eps);

% The following plots the convergence history of the methods using
% logarithmic scaling for the error between the exact and iterative
% solutions.
figure(3)
it = 1:length(Jerrv);
plot(it,log2(Jerrv),'r--')
hold on;
plot(it,log2(Gerrv),'b--')
plot(it,log2(Serrv),'g--')
hold off;



% add title, labels, and legends to the above plots
figure(2)
title('Error between iterative solution and exact solution, m=7')
xlabel('Iteration number')
ylabel('log_2(error)')
legend('Jacobi','Gauss-Seidel','SOR');

figure(3)
title('Error between iterative solution and exact solution, m=15')
xlabel('Iteration number')
ylabel('log_2(error)')
legend('Jacobi','Gauss-Seidel','SOR');