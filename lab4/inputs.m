function [] = inputs()
    choice = menu('INPUTS', 'polynomial view', 'matrix view');

    switch choice
        case 1
            num = input("Enter numerator: ");
            den = input("Enter denominator: ");

            sys = tf(num, den);
            save("data.mat", "sys");
        case 2
            A = input("Enter matrix A: ");
            B = input("Enter matrix B: ");
            C = input("Enter matrix C: ");
            D = input("Enter matrix D: ");

            sys = ss(A, B, C, D);
            save("data.mat", "sys");
    end
end

