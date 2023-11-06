y0 = [0; 0; 0];
tspan = [0, 1];

[t_ode45, y_ode45] = ode45(@(t,y) ode_system(t, y, 1), tspan, y0);

u_func = @(t) 1;
y_rk = runge_kutta(t_ode45, y0, u_func);

figure;
plot(t_ode45, y_ode45(:,3), 'b', t_ode45, y_rk(3,:), 'r--');
legend('ode45', 'Runge-Kutta');
xlabel('t');
ylabel('y(t)');
title('RK vs ode4');