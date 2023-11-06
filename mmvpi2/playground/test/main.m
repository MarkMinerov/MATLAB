tspan = [0 10];
y0 = [1; 1];

[t, y] = ode45(@ode_system, tspan, y0);

plot(t, y(:, 1));
hold on
plot(t, y(:, 2));
hold off