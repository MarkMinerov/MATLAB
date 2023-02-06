clc;
clear;

step = 0.1;
tRange = [0 10];
Y0 = [1 0];

[t, y] = ode45(@NDR, tRange, Y0);
[t1, y1] = rk(@NDR, Y0, tRange, step);

subplot(3, 1, 1);
plot(t, y(:, 1));
title('Solving with NDR');
xlabel('t');
ylabel('y(t)');

subplot(3, 1, 2); 
plot(t1, y1(:, 1), 'g--');
title('Solving with Runge-Kutta');
xlabel('t');
ylabel('y(t)');

subplot(3, 1, 3); 
plot(t, y(:, 1));

hold on
plot(t1, y1(:, 1), 'g--');
hold off
title('Both solvings');
xlabel('t');
ylabel('y(t)');