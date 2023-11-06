function dydt = ode_system(t, y, m, c, k)
    dydt = [y(2); -(c/m)*y(2) - (k/m)*y(1)];
end