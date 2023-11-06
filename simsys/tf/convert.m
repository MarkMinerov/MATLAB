function [sys] = convert()
    load('data.mat', "sys");
    choice = menu('Choose func', 'To transfer function', 'To state space');

    switch choice
        case 1 % transfer function
            m = input("Enter mass: ");
            [num, den] = ss2tf(sys.A, sys.B, sys.C, sys.D, 1);
            num = num .* m;
            den = den .* m;

            disp(num);
            disp(den);
        case 2 %  State space
            [num, den] = tfdata(sys, 'v');
            [a, b, c, d] = tf2ss(num, den);

            disp(a);
            disp(b);
            disp(c);
            disp(d);
    end
end

