syms theta theta_dot

g = 9.81; 
l = 1;   
b = 0.1;

f = [theta_dot; -b*theta_dot - g/l*sin(theta)];

A = jacobian(f, [theta, theta_dot]);
B = [0; 1];
C = [1, 0];
D = 0;

A = subs(A, {theta, theta_dot}, {0, 0});
A = double(A);

disp(A);

sys = ss(A, B, C, D);