function [] = stability()
    load("data.mat", "sys");

    [num, den] = tfdata(sys, 'v');
    disp(num);
    disp(den);

    r = roots(den);
    max = size(r);

    test = 1;
    disp(r);
    
    for a = 1:max(:, 1)
        if r(a) > 0
            test = 0;
        end
    end

    if test == 0
        disp("Unstable");
    else
        disp("Stable or on the border");
    end
end

