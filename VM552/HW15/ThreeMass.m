clear; close all; clc; 

syms Jg Jm Jl Kg Ks s;
syms OmTm OlTm;

A = [s*(Jg*Jm*s^2+(Jg+Jm)*Kg), s*Jl*Kg; 
        Jm*s^2+Kg, -Kg/Ks*(Jl*s^2+Ks)];
b = [Jg*s^2+Kg; s];

x = A\b;

OmTm = collect(x(1))
OlTm = collect(x(2))

subs(OmTm, {Ks, Kg, Jm, Jl, Jg}, {100.0, 1000.0, 1.0, 1.0, 0.1})
subs(OlTm, {Ks, Kg, Jm, Jl, Jg}, {100.0, 1000.0, 1.0, 1.0, 0.1})

tf_OmTm = tf([0.1 0 1110 0 100000], [0.1 0 1210 0 210000 0])
tf_OlTm = tf([100000], [0.1 0 1210 0 210000 0])

figure(1)
bode(tf_OmTm)
figure(2)
bode(tf_OlTm)
