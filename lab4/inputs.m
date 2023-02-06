function [] = inputs()
    choice = menu('INPUTS', 'polynomial view', 'matrix view');

    switch choice
        case 1
            m = input("Enter mass of cart m = "); % 30 kg
            kp = input("Enter constant of spring kp = "); % 15
            kt = input("Enter constant of shock absorber kt = "); % 20

            num = [1];
            den = [m kp kt];

            sys = tf(num, den);
            save("data.mat", "sys");
            disp(sys)
        case 2
            m = input("Enter mass of cart m = "); % 30 kg
            kp = input("Enter constant of spring kp = "); % 15
            kt = input("Enter constant of shock absorber kt = "); % 20

            num = [1];
            den = [m kp kt];

            [A, B, C, D] = tf2ss(num, den);
            sys = ss(A, B, C, D);

            sys
            save("data.mat", "sys");
    end
end

