function dYdt = ODE(t, Y)
    Y1 = Y(1);
    Y2 = Y(2);

    dY1dt = Y2;
    dY2dt = 1 + 2*Y2 + 3*Y1;

    dYdt = [dY1dt; dY2dt];
end