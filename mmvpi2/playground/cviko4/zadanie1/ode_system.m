function dy = ode_system(t, y, u)
    dy = zeros(3,1);
    dy(1) = y(2);
    dy(2) = y(3);
    dy(3) = -3*y(2)^2 - y(2)*sqrt(y(3)) - 2*y(1) + u;
end