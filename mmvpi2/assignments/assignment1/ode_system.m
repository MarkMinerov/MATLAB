function dy = ode_system(y, g, l, b)
    dy = [y(2); -b*y(2) - g/l*sin(y(1))];
end

% θ′′(t)+bθ′(t)+g/l*sin(θ(t)) = 0