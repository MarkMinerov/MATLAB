function dydt = ode_system(t, y, l, g)
    dydt = [y(2); -(g/l) * sin(y(1))];  % m is cancelled out 
end