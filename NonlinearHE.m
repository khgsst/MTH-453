function NonlinearHE(dx,dt)
% 
% numerical solution of the non-linear heat equation
% u_t=(al(u)*u_x)_x, al=(1+3u^2)/(1+u^2)
% with initial condition f(x)=sin(3*pi*x)
% and BC u(0,t)=g1(t)=0, u(1,t)=g2(t)=0
% Try: NonlinearHE(0.2,0.02)
% Try: NonlinearHE(0.02,0.02)
% Try: NonlinearHE(0.02,0.000066)

% Note: dx<1/3 or else only one internal node

%check the stability condition:
nu=dt/(dx*dx),
nu_max=1/6

t=0.1; %we are interested in the solution of t=0.1.
x=[dx:dx:1-dx]; %all the inner points.
m=length(x);

%up is the previous solution and un is the next solution.
up=zeros(size(x)); un=zeros(size(x));

%initial condition:
up=sin(3*pi*x);

%main loop:
for n=1:t/dt,
  for j=1:m,
    if (j<m),
      alpha1 = alphafun(up(j+1)); %alpha(j+1,n)
    else
      alpha1 = alphafun(g2(n*dt)); %alpha(m,n)
    end,
    alpha2 = alphafun(up(j));     %alpha(j,n)
    if (j>1),
      alpha3 = alphafun(up(j-1)); %alpha(j-1,n)
    else
      alpha3 = alphafun(g1(n*dt)); %alpha(0,n)
    end,
    alphaR = (alpha1+alpha2)/2;         %alpha(j+1/2,n)
    alphaL = (alpha2+alpha3)/2;         %alpha(j-1/2,n)
    if (j==1), 
      %left boundary condition:
      un(j) = up(j)+nu*(alphaR*(up(j+1)-up(j))-alphaL*(up(j)-g1(n*dt)));
    elseif (j==m), 
      %right boundary condition:
      un(j) = up(j)+nu*(alphaR*(g2(n*dt)-up(j))-alphaL*(up(j)-up(j-1)));
    else
      un(j) = up(j)+nu*(alphaR*(up(j+1)-up(j))-alphaL*(up(j)-up(j-1)));
    end,

  end,
  %set un to up:
  up=un;
end,

figure
p=plot([0 x 1], [0 un 0]); set(p,'LineWidth',2),
ax=axis;
adx=ax(2)-ax(1); ady=ax(4)-ax(3);
h=text(0.1*adx+ax(1),.3*ady+ax(3), sprintf('dx=%g ', dx)); set(h,'FontSize',12);
h=text(0.1*adx+ax(1),.2*ady+ax(3), sprintf('dt=%g ', dt)); set(h,'FontSize',12);
h=text(0.1*adx+ax(1),.1*ady+ax(3), sprintf('\\alpha_0*dt/(dx*dx)=%g ', 3*nu)); 
set(h,'FontSize',12);

function al=alphafun(u)
al=(1+3*u^2)/(1+u^2);

function g1=g1(t)
g1=0;

function g2=g2(t)
g2=0;
