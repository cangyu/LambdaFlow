clear all; close all; clc;

T_inf = 372; %K
T_boil = 373.15; %K
Yf_inf = 0;
P = 101325; %Pa
P_sat = P;
W_air = 29; %g/mol
W_h2o = 18; %g/mol
R = 8.314; %J/(mol * K)
ql = 540 * 4.1868e3; %J/Kg
dH = ql * W_h2o / 1000; %J/mol
cp = 0.3 * 4.1868e3; %J/(Kg * K)

Yf_s = 0.1; %Inital guess
relaxation = 0.2;
cnt = 0;
while(true)
    cnt = cnt + 1;
    B = (Yf_s - Yf_inf)/(1 - Yf_s);
    T_s = T_inf - B * ql / cp;
    Xs = exp(-dH/R*(1/T_s - 1/T_boil));
    Y_new = Xs * W_h2o / (Xs * W_h2o + (1-Xs)*W_air);
    
    if(abs(Y_new - Yf_s)<1e-6)
        Yf_s = Y_new;
        m_dot = log(1+B);
        T_s = T_inf - B * ql / cp;
        break;
    else
        Yf_s = (1-relaxation) * Yf_s + relaxation * Y_new;
    end
end

fprintf('Total iteration: %d\n', cnt);
fprintf('Droplet temperature: %f K\n', T_s);
fprintf('Non-dimensional Vaporization rate: %f\n', m_dot);
