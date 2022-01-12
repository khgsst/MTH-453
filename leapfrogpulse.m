function leapfrogpulse(intervals,nu)
%intervals=20 => m = 19; nu=0.5; for example
%note that MATLAB does not allow index 0, so u=[u(1),...,u(m+2)];
  
  
% parameters
m=intervals-1;
h = 2*pi/(m+1);
k = nu*h;
for T = [1,3,5,7,9,11,13],

  % spatial mesh
  x = [-pi:h:pi];

  % temporal mesh
  nsteps = floor(T/k);
  
  % initial condition
  f=inline('exp(-5*(x-pi/2).^2)');
  u1 = f(x);
  
  %for leapfrog: need also initial values at t = k
  %we cheat for simplicity and use exact solution for u at t=k
  u2 = f((k+x));

  % time stepping
  for n=2:nsteps
    u0 = u1;
    u1 = u2;
    
    % interior x-points
    u2(2:m+1) = u0(2:m+1) + nu * (u1(3:m+2) - u1(1:m));
    
    % periodic BC: 
    u2(1) = u0(1) + nu * (u1(2)-u1(m+1));
    u2(m+2) = u2(1);

  end
  
  norm(u2)
  
  % plot results at t=T
  plot(x,u2,'-o')
  xlabel('x')
  ylabel('u')
  axis([-pi pi -0.5 1.1])
  title('Leap-frog scheme')
  pause
  
end

