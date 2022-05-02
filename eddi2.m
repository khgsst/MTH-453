% call methods with m=7 and 500 iterations:
[Jerrv,Jerrvh,Jerrvk]=lap2d_jacobi(7,500,2^-7.85392);
[Gerrv,Gerrvh,Gerrvk]=lap2d_gs(7,500,2^-7.85392);
[Serrv,Serrvh,Serrvk]=lap2d_sor(7,500,2^-7.85392);

% The following plots the convergence history of the methods using
% logarithmic scaling for the error between the exact and iterative
% solutions. 
figure(2)
it = 1:length(Jerrv);
plot(it,log2(Jerrvh),'r--')
hold on;
plot(it,log2(Gerrvh),'b--')
plot(it,log2(Serrvh),'g--')
hold off;

% The following plots the convergence history of the methods using
% logarithmic scaling for the error between the exact and iterative
% solutions. 
figure(3)
it = 1:length(Jerrvk);
plot(it,log2(Jerrvk),'r--')
hold on;
plot(it,log2(Gerrvk),'b--')
plot(it,log2(Serrvk),'g--')
hold off;

% call methods with m=15 and 3000 iterations:
[Jerrv,Jerrvh,Jerrvk]=lap2d_jacobi(15,3000,2^-9.81673);
[Gerrv,Gerrvh,Gerrvk]=lap2d_gs(15,3000,2^-9.81673);
[Serrv,Serrvh,Serrvk]=lap2d_sor(15,3000,2^-9,81673);

figure(4)
it = 1:length(Jerrv);
plot(it,log2(Jerrvh),'r--')
hold on;
plot(it,log2(Gerrvh),'b--')
plot(it,log2(Serrvh),'g--')
hold off;

figure(5)
it = 1:length(Jerrvk);
plot(it,log2(Jerrvk),'r--')
hold on;
plot(it,log2(Gerrvk),'b--')
plot(it,log2(Serrvk),'g--')
hold off;

% add title, labels, and legends to the above plots
figure(2)
title('Error between iterative solution and direct solution, m=7')
xlabel('Iteration number')
ylabel('log_2(error)')
legend('Jacobi','Gauss-Seidel','SOR');

figure(3)
title('Error between exact solution and direct solution, m=7')
xlabel('Iteration number')
ylabel('log_2(error)')
legend('Jacobi','Gauss-Seidel','SOR');

figure(4)
title('Error between iterative solution and direct solution, m=15')
xlabel('Iteration number')
ylabel('log_2(error)')
legend('Jacobi','Gauss-Seidel','SOR');

figure(5)
title('Error between exact solution and direct solution, m=15')
xlabel('Iteration number')
ylabel('log_2(error)')
legend('Jacobi','Gauss-Seidel','SOR');