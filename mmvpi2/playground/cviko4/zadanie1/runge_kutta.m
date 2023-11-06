function y = runge_kutta(t_vec, y0, u_func)
    num_points = length(t_vec);
    y = zeros(length(y0), num_points);
    y(:,1) = y0;
    
    for i = 2:num_points
        h = t_vec(i) - t_vec(i-1);
        t = t_vec(i-1);
        
        k1 = h * ode_system(t, y(:,i-1), u_func(t));
        k2 = h * ode_system(t + h/2, y(:,i-1) + k1/2, u_func(t + h/2));
        k3 = h * ode_system(t + h/2, y(:,i-1) + k2/2, u_func(t + h/2));
        k4 = h * ode_system(t + h, y(:,i-1) + k3, u_func(t + h));
        
        y(:,i) = y(:,i-1) + (k1 + 2*k2 + 2*k3 + k4) / 6;
    end
end
