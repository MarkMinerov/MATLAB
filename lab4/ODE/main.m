global u m kt kp;

u = input("Enter external force u(t) = "); % 10N
m = input("Enter mass of cart m = "); % 30 kg
kp = input("Enter constant of spring kp = "); % 15
kt = input("Enter constant of shock absorber kt = "); % 20
x0 = input("Enter start conditions x0 = "); % [0; 0]

tSpan = [0 20];

[t, x] = ode45('cart', tSpan, x0);

plot(t, x(:, 1), 'b-', t, x(:, 2), 'r--');
grid on
legend('y', 'dy/dt');
title('cart with shock absorber and spring');
xlabel('t');