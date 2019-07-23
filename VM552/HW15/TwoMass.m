clear; close all; clc; 

q = 0.1;
Jm = q * 2.0;
Jl = (1-q) * 2.0;
Ks = 100.0;

Ki = 1/4;
Kp = 5/4/sqrt(2);

wa = sqrt(Ks/Jl); % anti-resonance frequency
Ki = Ki*Jm*wa^2/q;
Kp = Kp*Jm*wa/q;

OlTm = tf([Ks], [Jm*Jl 0 Ks*(Jm+Jl) 0]);

OmTm = tf([Jl 0 Ks], [Jm*Jl 0 Ks*(Jm+Jl) 0]);

figure(1)
bode(OlTm)

figure(2)
bode(OmTm)
