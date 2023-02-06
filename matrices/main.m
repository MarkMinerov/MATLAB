R = input("Input R values as [R1 R2 R3 R4 R5 R6 R7]: ");
U = input("Input U values as [U1 U2]: ")';

I = MSP(U, R);
disp(I);

if I(1) + I(2) + I(3) - I(4) < 1e-6 && I(4) - (I(1) + I(2) + I(3)) < 1e-6
    disp("Prudy vo vetach vyhovuju 1. KZ");
else
    disp("Prudy vo vetach nevehovuju 1. KZ");
end