clear all; close all; clc;

T0 = 300;
Ti = 2200;
Tf = 2300;
P = oneatm;

gas = GRI30('Mix');
gascomp = 'CH4:0.5, O2:1, N2:3.6';

set(gas,'T', T0, 'P', P, 'X', gascomp);
rho_u = density(gas);
lambda1 = thermalConductivity(gas);
cp1 = cp_mass(gas);

set(gas,'T', Tf, 'P', P, 'X', gascomp);
lambda2 = thermalConductivity(gas);
cp2 = cp_mass(gas);

lambda = (lambda1 + lambda2)/2;
cp = (cp1 + cp2)/2;

SL = sqrt(2*lambda*summation(gas, Ti, Tf))/(rho_u * cp * (Ti - T0));

fprintf('\tDensity: %f Kg/m^3\n', rho_u);
fprintf('\tThermal Conductivity: %f W/(m K)\n', lambda);
fprintf('\tSpecific Heat: %f J/(Kg K)\n', cp);
fprintf('\tFlame Speed: %f m/s\n', SL);

function ret = s(tp, temp)
    set(tp,'T', temp);
    w = netProdRates(tp);
    h = enthalpies_RT(tp);
    ret = dot(w, h) * temp * gasconstant;
end

function ret = summation(tp, Ta, Tb)
    N = 10000;
    step = (Tb-Ta)/N;
    cur_T = Ta - step/2;
    ret = 0;
    for i = 1:N
        cur_T = cur_T + step;
        ret = ret + s(tp, cur_T);
    end
    ret = ret * step;    
end
