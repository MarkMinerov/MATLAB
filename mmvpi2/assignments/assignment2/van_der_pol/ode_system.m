function dydt = ode_system(t, y, mu)
     dydt = [y(2); mu*(1 - y(1)^2)*y(2) - y(1) + 1];
end