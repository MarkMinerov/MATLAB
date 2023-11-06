function [] = time_characts()
    load("data.mat", "sys");
    choice = menu("Time characteristics", 'Step', 'Impulse', 'Generate characteristic');

    switch choice
        case 1
            sys
            step(sys);
            title("Step time characteristic");
        case 2
            sys
            impulse(sys);
            title("Impulse characteristic");
        case 3
            type = input("Enter signal type, example 'pulse': ");
            Ton = input("Enter sampling period: ");
            Tf = input("Enter period of simulation: ");
            Ts = input("Enter increments Ts: ");
            [u, t] = gensig(type, Ton, Tf, Ts);

            lsim(sys, u, t);
            grid on;
            title('Response for any input signal');
    end

end

