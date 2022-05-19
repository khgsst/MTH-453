% call methods with m=7 and 500 iterations:
[Jerrv,Jerrvh,Jerrvk]=lap2d_jacobi(7,500,2^-7.85392);
[Gerrv,Gerrvh,Gerrvk]=lap2d_gs(7,500,2^-7.85392);
[Serrv,Serrvh,Serrvk]=lap2d_sor(7,500,2^-7.85392);

% The following plots the convergence history of the methods using
% logarithmic scaling for the error between the exact and iterative
% solutions. 
figure(2)
it = 1:length(Jerrvh);
Gerrvh2=Gerrvh(end)*ones(1,length(Jerrv))
Gerrvh2(:,1:length(Gerrv))=Gerrvh(1:end)
Serrvh2=Serrvh(end)*ones(1,length(Jerrv))
Serrvh2(:,1:length(Serrv))=Serrvh(1:end)
plot(it,log2(Jerrvh),'r--')
hold on;
plot(it,log2(Gerrvh2),'b--')
plot(it,log2(Serrvh2),'g--')
hold off;

% The following plots the convergence history of the methods using
% logarithmic scaling for the error between the exact and iterative
% solutions. 
figure(3)
it = 1:length(Jerrvk);
Gerrvk2=Gerrvk(end)*ones(1,length(Jerrv))
Gerrvk2(:,1:length(Gerrv))=Gerrvk(1:end)
Serrvk2=Serrvk(end)*ones(1,length(Jerrv))
Serrvk2(:,1:length(Serrv))=Serrvk(1:end)
plot(it,log2(Jerrvk),'r--')
hold on;
plot(it,log2(Gerrvk2),'b--')
plot(it,log2(Serrvk2),'g--')
hold off;

% call methods with m=15 and 3000 iterations:
[Jerrv,Jerrvh,Jerrvk]=lap2d_jacobi(15,3000,2^-9.81673);
[Gerrv,Gerrvh,Gerrvk]=lap2d_gs(15,3000,2^-9.81673);
[Serrv,Serrvh,Serrvk]=lap2d_sor(15,3000,2^-9.81673);

figure(4)
it = 1:length(Jerrvh);
Gerrvh2=Gerrv(end)*ones(1,length(Jerrv))
Gerrvh2(:,1:length(Gerrv))=Gerrv(1:end)
Serrvh2=Serrv(end)*ones(1,length(Jerrv))
Serrvh2(:,1:length(Serrv))=Serrv(1:end)
plot(it,log2(Jerrvh),'r--')
hold on;
plot(it,log2(Gerrvh2),'b--')
plot(it,log2(Serrvh2),'g--')
hold off;

figure(5)
it = 1:length(Jerrvk);
it = 1:length(Jerrvk);
Gerrvk2=Gerrvk(end)*ones(1,length(Jerrv))
Gerrvk2(:,1:length(Gerrv))=Gerrvk(1:end)
Serrvk2=Serrvk(end)*ones(1,length(Jerrv))
Serrvk2(:,1:length(Serrv))=Serrvk(1:end)
plot(it,log2(Jerrvk),'r--')
hold on;
plot(it,log2(Gerrvk2),'b--')
plot(it,log2(Serrvk2),'g--')
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