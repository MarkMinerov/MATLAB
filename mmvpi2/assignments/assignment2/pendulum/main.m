syms y1 y2 l g

eq_point = {0, 0};

f1 = y2;
f2 = -(g/l)*sin(y1);

Y = [y1; y2];
F = [f1; f2];

J = jacobian(F, Y);
J_eq = subs(J, {y1, y2}, eq_point);

disp("Jacobian Matrix at the equilibrium point:");
disp(J_eq);

eigenvalues = eig(J_eq);
disp("Eigenvalues at the equilibrium point:");
disp(eigenvalues);

l_input = input("Enter the length of the pendulum: ");
g_input = 9.81;

J_eq = subs(J_eq, {l, g}, {l_input, g_input});
J_eq = double(J_eq);

tspan = [0, 10];
Y0 = [pi/4, 0];

[t, Y] = ode45(@(t,Y) linearized_system(t, Y, J_eq), tspan, Y0);

figure(Name="Pendulum");

% Linear
subplot(2, 1, 1);
plot(t, Y(:,1), 'r', t, Y(:,2), 'b');
legend('y', 'y''');
title('Dynamics of the Linearized Pendulum System');
xlabel('Time (s)');
ylabel('States');
grid on;

[t, Y] = ode45(@(t,y) ode_system(t, y, l_input, g_input), tspan, Y0);
[t_rk, Y_rk] = RK(@(t,y) ode_system(t, y, l_input, g_input), Y0, tspan, 0.1);

% Non-linear
subplot(2, 1, 2);
plot(t, Y(:,1), 'r', t, Y(:,2), 'b');
title('Dynamics of the Pendulum System');
xlabel('Time (s)');
ylabel('States');
grid on;

hold on;
plot(t_rk, Y_rk(:, 1), '--r', LineWidth=2);
plot(t_rk, Y_rk(:, 2), '--b', LineWidth=2);
hold off;

legend('y', 'y''', 'RK y', 'RK y''');


initial_conditions = [0 0; pi/2 0; -pi/2 0; pi/4 0; -pi/4 0]; 
figure(Name="Phase Portrait");

for i = 1:size(initial_conditions, 1)
    y0 = initial_conditions(i,:);
    [t, y] = ode45(@(t, y) ode_system(t, y, l_input, g_input), tspan, y0);
    plot(y(:,1), y(:,2));
    hold on;
end

[Y, Y_dot] = meshgrid(-5*pi:0.2*pi:5*pi, -5:0.2:5);

U = Y_dot;
V = -(g_input/l_input) * sin(Y);

norms = sqrt(U.^2 + V.^2);
U = U ./ norms;
V = V ./ norms;

quiver(Y, Y_dot, U, V, 'b');

xlabel('y(t)');
ylabel('y''(t)');
title('Pendulum Phase Portrait');
grid on;


