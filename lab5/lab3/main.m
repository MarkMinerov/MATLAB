clc;
clear;

step = 0.1;
tRange = [0 10];
Y0 = [1 0];

[t, y] = ode45(@NDR, tRange, Y0);
[t1, y1] = rk(@NDR, Y0, tRange, step);
sim = sim("model.slx");

subplot(3, 1, 1);
plot(t, y(:, 1));
title('Solving with ode45');
xlabel('t');
ylabel('y(t)');

subplot(3, 1, 2);
plot(t1, y1(:, 1), 'g--');
title('Solving with Runge-Kutta');
xlabel('t');
ylabel('y(t)');

subplot(3, 1, 3);
plot(sim.y.Time, sim.y.Data(:, 1), 'r');
title('Solving with Simulink');
xlabel('t');
ylabel('y(t)');