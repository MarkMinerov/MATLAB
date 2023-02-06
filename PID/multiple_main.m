simulation = sim("model_6.slx");

t = simulation.tout;
data = simulation.multiple.Data;

step = data(:, 1);
step_dist = data(:, 2);
y = data(:, 3);

plot(t, step, 'r', 'LineWidth', 2);
grid on
hold on
title('Simulation with PID regulator');
xlabel('t');
ylabel('y(t)');
% 
hold on
plot(t, step_dist, 'b--', 'LineWidth', 2);

hold on
plot(t, y, 'g', 'LineWidth', 2);

legend('Step Signal', 'Step Signal 2', 'System output');

