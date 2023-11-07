function dYdt = linearized_system(t, Y, Jr)
    dYdt = Jr * Y;
end