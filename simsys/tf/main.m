set(0, "DefaultUIControlFontSize", 16);

choice = menu( ...
    'CHOOSE OPTION', ...
    'Enter params', ...
    'Convert', ...
    'Time characteristics', ...
    'frequency characteristics', ...
    'stability', ...
    'Exit' ...
);

exit = 0;

switch choice
    case 1 % Enter params
        inputs();
    case 2 % Convert
        convert();
    case 3 % Time characteristics
        time_characts();
    case 4 % Frequency characteristics
        frequency_characts();
    case 5 % Stability
        stability();
    case 6
        exit = 1;
end

if exit == 0 
    main
end