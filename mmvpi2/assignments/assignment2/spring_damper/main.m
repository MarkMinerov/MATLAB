syms y1 y2 m c k

eq_point = {0, 0};

f1 = y2;
f2 = -(c/m)*y2 - (k/m)*y1;

Y = [y1; y2];
F = [f1; f2];

J = jacobian(F, Y);
J_eq = subs(J, {y1, y2}, eq_point);

disp("Jacobian Matrix: ");
disp(J_eq);

% check whether the equilibrium point is stable
eigenvalues = eig(J_eq);
disp("Eigen values: ");
disp(eigenvalues);

m_input = input("Enter mass: "); % 1
c_input = input("Enter damping coefficient: "); % 0.5
k_input = input("Enter spring constant: "); % 3

J_eq = subs(J_eq, {k, c, m}, {k_input, c_input, m_input});
J_eq = double(J_eq);

Y0 = [1; 0];
tspan = [0 10];
[t, Y] = ode45(@(t,Y) linearized_system(t, Y, J_eq), tspan, Y0);


figure(Name="Spring Damper");

% Linear
subplot(2, 1, 1);
plot(t, Y(:,1), 'r', t, Y(:,2), 'b');
legend('y (displacement)', 'y'' (velocity)');
title('Dynamics of the Linearized Spring-Damper System');
xlabel('Time (s)');
ylabel('States');
grid on;

[t, Y] = ode45(@(t,y) ode_system(t, y, m_input, c_input, k_input), tspan, Y0);
[t_rk, Y_rk] = RK(@(t,y) ode_system(t, y, m_input, c_input, k_input), Y0, tspan, 0.1);

% Non-linear
subplot(2, 1, 2);
plot(t, Y(:,1), 'r', t, Y(:,2), 'b');
title('Dynamics of the Spring-Damper System');
xlabel('Time (s)');
ylabel('States');
grid on;

hold on;
plot(t_rk, Y_rk(:, 1), '--r', LineWidth=2);
plot(t_rk, Y_rk(:, 2), '--b', LineWidth=2);
hold off;

legend('y (displacement)', 'y'' (velocity)', 'RK y (displacement)', 'RK y'' (velocity)');

% Different initial conditions for spring-damper
initial_conditions = [0 0; 1 0; -1 0; 0.5 0; -0.5 0]; 
figure(Name="Phase Portrait");

for i = 1:size(initial_conditions, 1)
    y0 = initial_conditions(i,:);
    % State equations for spring-damper
    [t, y] = ode45(@(t, y) [y(2); -(c_input/m_input)*y(2) - (k_input/m_input)*y(1)], tspan, y0);
    plot(y(:,1), y(:,2));
    hold on;
end

% Mesh grid for phase portrait
[Y, Y_dot] = meshgrid(-2:0.2:2, -2:0.2:2); % Adjusted range for displacement and velocity

% Derivatives
U = Y_dot;
V = -(c_input/m_input)*Y_dot - (k_input/m_input)*Y;

% Normalize
norms = sqrt(U.^2 + V.^2);
U = U ./ norms;
V = V ./ norms;

% Plot phase portrait
quiver(Y, Y_dot, U, V, 'b');

xlabel('y(t)');
ylabel('y''(t)');
title('Spring-Damper Phase Portrait');
grid on;