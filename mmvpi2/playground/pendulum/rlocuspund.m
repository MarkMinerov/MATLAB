syms theta theta_dot

g = 9.81; 
l = 1;   
b = 0.1;

% θ′′(t)+bθ′(t)+g/l*sin(θ(t))=0
f = [theta_dot; -b*theta_dot - g/l*sin(theta)];

A = jacobian(f, [theta, theta_dot]);
B = [0; 1];
C = [1, 0];
D = 0;

A = subs(A, {theta, theta_dot}, {0, 0});
A = double(A);

sys = ss(A, B, C, D);
[num, den] = ss2tf(A, B, C, D);

sys_tf = tf(num, den);

rlocus(sys_tf);
