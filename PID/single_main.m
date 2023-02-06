simulation = sim("model.slx");

t = simulation.tout;
data = simulation.single.Data;

y = data(:, 1);
step0_1 = data(:, 2);

plot(t, step0_1, 'k', 'LineWidth', 2);
grid on
hold on
title('Simulation with PID regulator');
xlabel('t');
ylabel('y(t)');

plot(t, y, 'b', 'LineWidth', 2);
legend('Step from 0 to 1', 'System output');
