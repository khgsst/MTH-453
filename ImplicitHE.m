function ImplicitHE(dx,dt)
% solve the heat equation using implicit scheme
% solve Ut=Uxx for x in (0,1), t>0
%  U(0,t)=U(1,t)=0, u(x,0)=f(x)= 2x (when x<0.5), 2-2x (otherwise)
% Try: ImplicitHE(0.02,0.0002)

t=0.1; 
%exact solution:
ex=[0:0.01:1];  u_exact=zeros(size(ex));
for n=1:200,
  u_exact=u_exact+8/pi/pi*sin(n*pi/2)/n/n*exp(-(n*pi)^2*t)*sin(n*pi*ex);
end,

m=round(1/dx)-1; N=round(t/dt); nu=dt/(dx*dx),
x=[dx:dx:1-dx];    %all the inner grid points

%b will be the initial solution
b=zeros(size(x))';

%initial condition:
for i=1:m,

  %%%%% change .5 to .25 to see discontinuous initial data
  if x(i)<0.5,

    %%%%% along with .25 above, change 2 to 6 to see asymmetry
    b(i)=2*x(i);
  
  else 
    b(i)=2*(1-x(i));
  end,
end,

% The implicit scheme gives us the system of linear equations
%             (I-kA)U^{n+1} = U^n
% since the coefficient matrix B = I-kA is tri-diagonal with constant 
% sup/sub/ diagonal elements, we can use three scalar values to 
% present A, namely, alpha, beta and gamma. 
alpha=1+2*nu; beta=-nu; gamma=-nu;

% Build the matrix B
e = ones(m,1);
B = alpha*diag(e,0)+beta*diag(e(2:m),-1)+gamma*diag(e(1:m-1),1);

figure

% uncomment to plot initial data
plot(ex,u_exact,'-',x,b,'--r'); 

% uncomment to show all plots at once
hold on


for nt=1:N,

  % Solve the system by Gaussian elimination
  b = B\b;

  % uncomment to show plot of each time step
  %plot(ex,u_exact,'-',x,b,'--o');
  %pause

end

plot(ex,u_exact,'-',x,b,'--o');
h=text(0.2,0.05,sprintf('dx=%g, dt=%g, r=%g',dx,dt,nu)); 
set(h,'FontSize',12),
