function [] = frequency_characts()
    % http://matlab.fei.tuke.sk/ss/ukazka_zadania4_1_3_2.aspx
    load("data.mat", "sys");
    choice = menu("Frequency characteristics", "Nyquist", "Bode", "Nichols");

    
    switch choice
        case 1
            nyquist(sys);
            title("Nyquist frequency characteristic");

        case 2
            bode(sys);
            title("Bode frequency characteristic");

        case 3
            nichols(sys);
            title("Nichols frequency characteristic");
    end
end

