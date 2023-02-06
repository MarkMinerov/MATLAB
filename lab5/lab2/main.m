clear;

tRange(2) = input("Enter end time interval value: ");
Y0 = input("Enter start values: [Y0; Y1]: ");
out = sim("model.slx");

tRange(1) = 0;

[t, y] = ode45(@ODE, tRange, Y0);

d = analyt(t);

% ode45
subplot(4,1,1);
plot(t, y(:, 1), 'b');
title('ode45');
xlabel('t');
ylabel('y(t)');

subplot(4,1,2);
% analyt
plot(t, d, 'r--');
title('analytical');
xlabel('t');
ylabel('y(t)');

% simulink
subplot(4,1,3);
plot(out.y.Time, out.y.Data, 'g--');
title('simulink');
xlabel('t');
ylabel('y(t)');

% all
subplot(4,1,4);
plot(t, y(:, 1), 'b');
hold on
plot(t, d, 'r--');
plot(out.y.Time, out.y.Data, 'g--');

title('All');
xlabel('t');
ylabel('y(t)');

hold off

