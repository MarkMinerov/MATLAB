syms y1 y2 mu

eq_point = input("Enter equilibrium point: "); % [1.5, 0]
ut = input("Enter u(t): "); % 1
f1 = y2;
f2 = mu*(1-y1^2)*y2 - y1 + ut;

Y = [y1; y2];
F = [f1; f2];

J = jacobian(F, Y);
J_eq = subs(J, {y1, y2}, eq_point);

disp("Jacobian Matrix at the equilibrium point:");
disp(J_eq);

eigenvalues = eig(J_eq);
disp("Eigenvalues at the equilibrium point:");
disp(eigenvalues);

mu_input = input("Enter parameter mu: "); % 0 - 1

J_eq = subs(J_eq, mu, mu_input);
J_eq = double(J_eq);

tspan = [0, 20];
y0 = [0.5; 0];

[t, y] = ode45(@(t, y) ode_system(t, y, mu_input), tspan, y0);
[t_rk, Y_rk] = RK(@(t,y) ode_system(t, y, mu_input), y0, tspan, 0.1);

figure(Name="Van Der Pol");

% Non-Linear
subplot(2, 1, 1);
plot(t, y(:,1), 'r', t, y(:,2), 'b');
xlabel('Time');
ylabel('Solution');
title('Van der Pol Oscillator');
grid on;
hold on;
plot(t_rk, Y_rk(:, 1), '--g', "lineWidth", 2);
plot(t_rk, Y_rk(:, 2), '--r', "lineWidth", 2);
hold off;
legend('y ode45', 'y'' ode45', 'y Runge-Kutta', 'y'' Runge-Kutta');

[t, Y] = ode45(@(t, Y) linearized_system(t, Y, J_eq), tspan, [0; 0.01]);

% Linear
subplot(2, 1, 2);
plot(t, Y(:,1), 'r', t, Y(:,2), 'b');
legend('y', 'y''');
title('Dynamics of the Linearized Spring-Damper System');
xlabel('Time (s)');
ylabel('States');
grid on;

initial_conditions = [0 0; 2 0; -2 0; 1 0; -1 0]; 
figure('Name', 'Van der Pol Phase Portrait');

for i = 1:size(initial_conditions, 1)
    y0 = initial_conditions(i,:);
    [t, y] = ode45(@(t, y) ode_system(t, y, mu_input), tspan, y0);
    plot(y(:,1), y(:,2));
    hold on;
end

[Y, Y_dot] = meshgrid(-3:0.2:3, -3:0.2:3);

U = Y_dot;
V = mu_input*(1 - Y.^2).*Y_dot - Y;

norms = sqrt(U.^2 + V.^2);
U = U ./ norms;
V = V ./ norms;

quiver(Y, Y_dot, U, V, 'b');

xlabel('y(t)');
ylabel('y''(t)');
title('Van der Pol Phase Portrait');
grid on;
