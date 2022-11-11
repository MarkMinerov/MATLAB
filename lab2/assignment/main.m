global a;
a = input('[a2 a1 a0]');
T(2) = input('Enter T');
PP = input('[P0 P1]');
T(1) = 0;
[t, y] = ode45('dy', T, PP);
d= 3/25 .* exp (-5 .* t) +37/75 .* exp (-t) .* sin (3 .* t) -3/25 .* exp (-t) .* cos (3 .* t);

disp(y(:, 1));
disp(t);

subplot(3, 1, 1);
plot(t, y(:, 1));
subplot(3,1,2);
plot(t, d, 'g');
subplot(3,1,3);
plot(t, y(:, 1), t, d, 'g');