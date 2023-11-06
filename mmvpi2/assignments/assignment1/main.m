syms theta theta_dot

g = 9.81;

inputType = input("Are your coefficients normal or it is a Jacobian Matrix? (J/n): ", 's');

while inputType ~= 'J' && inputType ~= 'n'
    inputType = input("Are your coefficients normal or it is a Jacobian Matrix? (J/n): ", 's');
end

if inputType == 'n'
    l = input('Enter the length of pendulum: ');
    b = input('Enter damping coefficient: ');
    f = [theta_dot; -b*theta_dot - g/l*sin(theta)];
    jacobMatrix = jacobian(f, [theta, theta_dot]);

else
    jacobMatrix = input("Enter Jacobian params:");
    jacobSize = size(jacobMatrix);

    if numel(jacobSize) ~= 2 || jacobSize(1) ~= 2 || jacobSize(2) ~= 2
        disp("Jacobian matrix size should be 2x2!");
        return
    end
end

tEnd = input("Enter stop time: ");

disp("Jacobian matrix:");
disp(jacobMatrix);

tspan = [0 tEnd];
initial_conditions = [0 0; pi/4 0; pi/2 0; 3*pi/4 0; -pi/4 0; -pi/2 0];
figure;

for i = 1:size(initial_conditions, 1)
    y0 = initial_conditions(i,:);
    options = odeset('Jacobian', @(t, y) jacobian_fn(y0, g, l, b));
    [t, y] = ode45(@(t, y) ode_system(y, g, l, b), tspan, y0, options);
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