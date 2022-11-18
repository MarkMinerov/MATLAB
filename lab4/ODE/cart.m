 function dXdt = cart(t, X)
    global u m kt kp;

    X1 = X(1);
    dX2dt = X(2);
    dX3dt = u/m - (kp * X1) / m - (kt * dX2dt) / m;

    dXdt = [dX2dt; dX3dt];
end