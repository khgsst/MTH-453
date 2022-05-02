kj=zeros(1,5)
kg=zeros(1,5)
ks=zeros(1,5)

[Jerrv]=lap2d_jacobi(3,1000,0.016565446555151);
[Gerrv]=lap2d_gs(3,1000,0.016565446555151);
[Serrv]=lap2d_sor(3,1000,0.016565446555151);

figure(2)
it = 1:length(Jerrv);
Gerrv2=Gerrv(end)*ones(1,length(Jerrv))
Gerrv2(:,1:length(Gerrv))=Gerrv(1:end)
Serrv2=Serrv(end)*ones(1,length(Jerrv))
Serrv2(:,1:length(Serrv))=Serrv(1:end)
kj(:,1)=length(Jerrv)
kg(:,1)=length(Gerrv)
ks(:,1)=length(Serrv)
plot(it,log2(Jerrv),'r--')
hold on;
plot(it,log2(Gerrv2),'b--')
plot(it,log2(Serrv2),'g--')
hold off;

% call methods with m=7 and 500 iterations:
[Jerrv]=lap2d_jacobi(7,1000,0.004322498199813);
[Gerrv]=lap2d_gs(7,1000,0.004322498199813);
[Serrv]=lap2d_sor(7,1000,0.004322498199813);

% The following plots the convergence history of the methods using
% logarithmic scaling for the error between the exact and iterative
% solutions. 
figure(3)
it = 1:length(Jerrv);
Gerrv2=Gerrv(end)*ones(1,length(Jerrv))
Gerrv2(:,1:length(Gerrv))=Gerrv(1:end)
Serrv2=Serrv(end)*ones(1,length(Jerrv))
Serrv2(:,1:length(Serrv))=Serrv(1:end)
kj(:,2)=length(Jerrv)
kg(:,2)=length(Gerrv)
ks(:,2)=length(Serrv)
plot(it,log2(Jerrv),'r--')
hold on;
plot(it,log2(Gerrv2),'b--')
plot(it,log2(Serrv2),'g--')
hold off;

% call methods with m=15 and 500 iterations:
[Jerrv]=lap2d_jacobi(15,1500,0.001104612077573);
[Gerrv]=lap2d_gs(15,1500,0.001104612077573);
[Serrv]=lap2d_sor(15,1500,0.001104612077573);

% The following plots the convergence history of the methods using
% logarithmic scaling for the error between the exact and iterative
% solutions.
figure(4)
it = 1:length(Jerrv);
Gerrv2=Gerrv(end)*ones(1,length(Jerrv))
Gerrv2(:,1:length(Gerrv))=Gerrv(1:end)
Serrv2=Serrv(end)*ones(1,length(Jerrv))
Serrv2(:,1:length(Serrv))=Serrv(1:end)
kj(:,3)=length(Jerrv)
kg(:,3)=length(Gerrv)
ks(:,3)=length(Serrv)
plot(it,log2(Jerrv),'r--')
hold on;
plot(it,log2(Gerrv2),'b--')
plot(it,log2(Serrv2),'g--')
hold off;

[Jerrv]=lap2d_jacobi(31,2000,2.779614578511391e-04);
[Gerrv]=lap2d_gs(31,2000,2.779614578511391e-04);
[Serrv]=lap2d_sor(31,2000,2.779614578511391e-04);

figure(5)
it = 1:length(Jerrv);
Gerrv2=Gerrv(end)*ones(1,length(Jerrv))
Gerrv2(:,1:length(Gerrv))=Gerrv(1:end)
Serrv2=Serrv(end)*ones(1,length(Jerrv))
Serrv2(:,1:length(Serrv))=Serrv(1:end)
kj(:,4)=length(Jerrv)
kg(:,4)=length(Gerrv)
ks(:,4)=length(Serrv)
plot(it,log2(Jerrv),'r--')
hold on;
plot(it,log2(Gerrv2),'b--')
plot(it,log2(Serrv2),'g--')
hold off;

[Jerrv]=lap2d_jacobi(63,11000,6.962716339442565e-05);
[Gerrv]=lap2d_gs(63,11000,6.962716339442565e-05);
[Serrv]=lap2d_sor(63,11000,6.962716339442565e-05);

figure(6)
it = 1:length(Jerrv);
Gerrv2=Gerrv(end)*ones(1,length(Jerrv))
Gerrv2(:,1:length(Gerrv))=Gerrv(1:end)
Serrv2=Serrv(end)*ones(1,length(Jerrv))
Serrv2(:,1:length(Serrv))=Serrv(1:end)
kj(:,5)=length(Jerrv)
kg(:,5)=length(Gerrv)
ks(:,5)=length(Serrv)
plot(it,log2(Jerrv),'r--')
hold on;
plot(it,log2(Gerrv2),'b--')
plot(it,log2(Serrv2),'g--')
hold off;

m=[3 7 15 31 63]
figure(7)
plot(m,kj,'r--')
hold on;
plot(m,kg,'b--')
plot(m,ks,'g--')
hold off;

for i=1:5
kj2(:,i)=kj(:,i)/m(:,i)
kg2(:,i)=kg(:,i)/m(:,i)
ks2(:,i)=ks(:,i)/m(:,i)
end

figure(8)
plot(log2(m),log2(kj2),'r--')
hold on;
plot(log2(m),log2(kg2),'b--')
plot(log2(m),log2(ks2),'g--')
hold off;

figure(9)
h=[1/4 1/8 1/16 1/32 1/64]
fe=[0.016565446555151 0.004322498199813 0.001104612077573 2.779614578511391e-04 6.962716339442565e-05]
plot(log2(h),log2(fe))

for i=1:5
kj3(:,i)=kj(:,i)/log2(m(:,i))
kg3(:,i)=kg(:,i)/log2(m(:,i))
ks3(:,i)=ks(:,i)/log2(m(:,i))
end

figure(10)
plot(log2(m),log2(kj3),'r--')
hold on;
plot(log2(m),log2(kg3),'b--')
plot(log2(m),log2(ks3),'g--')
hold off;



% add title, labels, and legends to the above plots
figure(2)
title('Error between iterative solution and exact solution, m=3')
xlabel('Iteration number')
ylabel('log_2(error)')
legend('Jacobi','Gauss-Seidel','SOR');

figure(3)
title('Error between iterative solution and exact solution, m=7')
xlabel('Iteration number')
ylabel('log_2(error)')
legend('Jacobi','Gauss-Seidel','SOR');

figure(4)
title('Error between iterative solution and exact solution, m=15')
xlabel('Iteration number')
ylabel('log_2(error)')
legend('Jacobi','Gauss-Seidel','SOR');

figure(5)
title('Error between iterative solution and exact solution, m=31')
xlabel('Iteration number')
ylabel('log_2(error)')
legend('Jacobi','Gauss-Seidel','SOR');

figure(6)
title('Error between iterative solution and exact solution, m=63')
xlabel('Iteration number')
ylabel('log_2(error)')
legend('Jacobi','Gauss-Seidel','SOR');

figure(7)
title('Number of iterations vs m')
xlabel('m')
ylabel('Number of iterations')
legend('Jacobi','Gauss-Seidel','SOR');

figure(8)
title('Ratio of number of iterations to m vs m along log2 axes')
xlabel('m')
ylabel('Ratio of number of iterations to m')
legend('Jacobi','Gauss-Seidel','SOR');
axis equal

figure(9)
title('Final error vs h')
xlabel('h')
ylabel('Final error')
axis equal

figure(10)
title('Ratio of number of iterations to log2(m) vs m along log2 axes')
xlabel('m')
ylabel('Ratio of number of iterations to log2(m)')
legend('Jacobi','Gauss-Seidel','SOR');
axis equal