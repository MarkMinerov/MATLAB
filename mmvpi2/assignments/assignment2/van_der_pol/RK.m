function [t, y] = RK(f, Y0, tRange, h)
    t = tRange(1):h:tRange(2);
    y(1, 1) = Y0(1);
    y(1, 2) = Y0(2);
 
    for i = 1:(length(t) - 1)
        K1 = h .* f(t(i), y(i, :));
        K2 = h .* f(t(i) + 0.5 .* h, y(i, :) + K1' ./ 2);
        K3 = h .* f(t(i) + 0.5 .* h, y(i, :) + K2' ./ 2);
        K4 = h .* f(t(i) + h, y(i, :) + K3');
        y(i + 1, :) = y(i, :) + (K1' + 2 .* (K2' + K3') + K4') ./ 6;
    end
end

