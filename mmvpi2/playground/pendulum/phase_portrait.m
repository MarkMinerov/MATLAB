tspan = [0 20];
initial_conditions = [0 0; pi/4 0; pi/2 0; 3*pi/4 0; -pi/4 0; -pi/2 0];
figure;

for i = 1:size(initial_conditions, 1)
    [t, y] = ode45(@(t,y) ode_system(t, y, 1), tspan, initial_conditions(i,:));
    plot(y(:,1), y(:,2));
    hold on;
end

% Mesh grid for phase portrait
[theta, theta_dot] = meshgrid(-3*pi:0.5:3*pi, -6:0.5:6);

% Derivatives
U = theta_dot;
V = -0.1*theta_dot - 9.81/1*sin(theta);

% Normalize
norms = sqrt(U.^2 + V.^2);
U = U ./ norms;
V = V ./ norms;

% Plot phase portrait
quiver(theta, theta_dot, U, V, 'b');

xlabel('\theta(t)');
ylabel('\theta''(t)');
title('Pendulum phase portrait');
grid on;
