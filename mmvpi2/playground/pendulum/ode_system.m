% % θ′′(t)+bθ′(t)+g/l*sin(θ(t))=0
function dy = ode_system(t, y, u)
    g = 9.81;
    l = 1;
    b = 0.1;

    dy = zeros(2,1);
    dy(1) = y(2);
    dy(2) = -b*y(2) - g/l*sin(y(1)) + u;
end
