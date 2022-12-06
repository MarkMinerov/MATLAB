clear;

tRange(2) = input("Enter end time interval value: ");
Y0 = input("Enter start values: [Y0; Y1]: ");
out = sim("model.slx");

tRange(1) = 0;

[t, y] = ode45(@ODE, tRange, Y0);

d = analyt(t);

% ode45
plot(t, y(:, 1));
hold on
% analyt
plot(t, d, 'r.', "LineWidth", 4);

hold on
% simulink
plot(out.y.Time, out.y.Data, 'b--');
hold off