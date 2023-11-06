syms theta theta_dot

% params
g = 9.81;
l = 1;
b = 0.1;  

f1 = theta_dot;
f2 = -b*theta_dot - g/l*sin(theta);

% solve where f1 == 0 and f2 == 0
equilibrium_points = solve([f1 == 0, f2 == 0], [theta, theta_dot]);

disp(equilibrium_points);