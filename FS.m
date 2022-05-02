x=linspace(0,1,1000)
u=0
for p=1:200
    u=u+sin((p*pi)/2)/(p^2)*exp((-0.1*(p*pi)^2))*sin(p*pi*x)
end
plot(x,8/(pi^2)*u)