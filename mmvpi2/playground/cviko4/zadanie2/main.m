data = sim("model.slx");
t = data.tout;
usim = data.usim.Data;
ysim = data.ysim.Data;


figure;
subplot(2, 1, 1);
plot(t, usim, LineWidth=3, Color="magenta");
title("Clamped PI(s) output");
xlabel("t");
ylabel("y(t)");

subplot(2, 1, 2);
plot(t, ysim(:, 1), LineWidth=2, Color="red", LineStyle="-");
hold on
plot(t, ysim(:, 2), LineWidth=2, Color="blue", LineStyle="--");
hold off
title("System output");
xlabel("t");
ylabel("y(t)");