clear all
out = sim('STRbase_Final_r2022a_final')
t=out.tout;
pars=[1.783 -0.8187 0.01307 0.01222];
%%
close all
ln=1.5;

for i=1:4
    for j=1:length(out.params.signals.values)
        par(j,i)=out.params.signals.values(i,1,j);
    end
    plot(t,par(:,i),'LineWidth',ln)
    hold on
end
legend("-a1","-a2","b1","b2")
yline(pars)
title("Parameter Sistem")

paramss_iden_vs_real = [par(end,:)' pars']

figure
plot(t,out.compare.signals(1).values,'LineWidth',ln)
hold on
plot(t,out.compare.signals(2).values,'LineWidth',ln)
plot(t,out.compare.signals(3).values,'LineWidth',ln)
plot(t,out.compare.signals(4).values,'LineWidth',ln)

legend("RLS","Set Point","Sistem Asli","Sistem Unity Feedback")
title("Perbandingan Respon")


figure
semilogy(t,abs(out.err.signals.values),'LineWidth',ln)
title("Error RLS")

figure
for i=1:3
    for j=1:length(out.params.signals.values)
        pid(j,i)=out.pid.signals.values(1,i,j);
    end
    plot(t,pid(:,i),'LineWidth',ln)
    hold on
end
legend("Kp","Ki","Kd")
title("Nilai Gain PID")

