function xder = dy(t,x)
    global a;
    xder = [x(2); (3.*exp(-5 .* t) - a(2) .* x(2) - a(3) .* x(1)) ./ a(1)];
end

