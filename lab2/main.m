tRange(2) = input("Enter end time interval value: ");
Y0 = input("Enter start values: [Y0; Y1]: ");

tRange(1) = 0;

[t, y] = ode45(@ODE, tRange, Y0);

d = analyt(t);

subplot(3, 1, 1);
plot(t, y(:, 1));

title('numericka riesenie y(t)');
xlabel('t');
ylabel('yn(t)');

subplot(3,1,2);
plot(t, d, 'g');

title('analyticke riesenie y(t)');
xlabel('t');
ylabel('ya(t)');

subplot(3,1,3);
plot(t, y(:, 1), t, d, 'g');

title('obe spolu');
xlabel('t');
ylabel('yn(t),ya(t)');