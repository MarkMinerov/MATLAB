function dXdt = ode_system(t,x)
    dXdt = [x(1); -2*x(1) - 3*x(2)];
end

