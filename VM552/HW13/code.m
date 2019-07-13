clear all; close all; clc;

T1 = 0.1;
T2 = 0.01;
T3 = 0.001;

G1 = tf([1], [1 0 0])
G2 = tf([10], [1 2 0])
G3 = tf([8], [1 2 -8 0])

G1z1 = c2d(G1, T1, 'tustin')
G1z2 = c2d(G1, T2, 'tustin')
G1z3 = c2d(G1, T3, 'tustin')

G2z1 = c2d(G2, T1, 'tustin')
G2z2 = c2d(G2, T2, 'tustin')
G2z3 = c2d(G2, T3, 'tustin')

G3z1 = c2d(G3, T1, 'tustin')
G3z2 = c2d(G3, T2, 'tustin')
G3z3 = c2d(G3, T3, 'tustin')

% bode(G1, '-', G1z1, '-^', G1z2, '-o', G1z3, '-*')

% bode(G2, '-', G2z1, '-^', G2z2, '-o', G2z3, '-*')

bode(G3, '-', G3z1, '-^', G3z2, '-o', G3z3, '-*')


