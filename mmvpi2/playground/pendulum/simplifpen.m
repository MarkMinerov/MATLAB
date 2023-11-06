syms theta theta_dot l g

% θ′′(t)+bθ′(t)+g/lsin(θ(t)) = 0
f1 = theta_dot;
f2 = -0.1*theta_dot - g/l*sin(theta);

J = jacobian([f1; f2], [theta, theta_dot]);

disp(J);