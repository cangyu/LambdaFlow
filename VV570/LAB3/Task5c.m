clear all; close all; clc;

f = @(x) x.^2 - sin(x+1);

[b,fval,exitflag,output] = fzero(f, 0.5)