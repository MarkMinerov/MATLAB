function dXdt = NDR(t, X)
    X1 = X(1);
    X2 = X(2);

    dX1dt = X2;
    dX2dt = (sin(2 .* pi) - 4 .* cos(X2) .* X1) ./ 3;

    dXdt = [dX1dt; dX2dt];
end

