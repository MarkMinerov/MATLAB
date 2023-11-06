function J = jacobian_fn(y, g, l, b)
    J = zeros(2,2);
    J(1,2) = 1;
    J(2,1) = -g/l*cos(y(1));
    J(2,2) = -b;
end