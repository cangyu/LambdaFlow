clear all; close all; clc;

Tu = 300;
T = 1500;
P = oneatm;
fprintf('Flame Thickness Estimation at T=%d K, P=%d Pa\n', T, P);

fprintf('===============Mehtane-Oxygen================\n');
gas = GRI30('Mix');
gascomp = 'CH4:1, O2:2';
set(gas,'T', Tu, 'P', P, 'X', gascomp);
rho = density(gas);
fprintf('\tDensity: %f Kg/m^3\n', rho);
set(gas,'T', T, 'P', P, 'X', gascomp);
lambda = thermalConductivity(gas);
fprintf('\tThermalConductivity: %f W/(mK)\n', lambda);
cp = cp_mass(gas);
fprintf('\tSpecific Heat: %f J/(Kg K)\n', cp);
alpha = lambda / (rho * cp);
S = 0.3;
fprintf('\tAssume flame speed to be: %f m/s\n', S);
delta = alpha / S;
fprintf('\tEstimated flame thickness: %f mm\n', delta*1000);

fprintf('===============Hydrogen-Oxygen===============\n');
gas = GRI30('Mix');
gascomp = 'H2:2, O2:1';
set(gas,'T', Tu, 'P', P, 'X', gascomp);
rho = density(gas);
fprintf('\tDensity: %f Kg/m^3\n', rho);
set(gas,'T', T, 'P', P, 'X', gascomp);
lambda = thermalConductivity(gas);
fprintf('\tThermalConductivity: %f W/(mK)\n', lambda);
cp = cp_mass(gas);
fprintf('\tSpecific Heat: %f J/(Kg K)\n', cp);
alpha = lambda / (rho * cp);
S = 3;
fprintf('\tAssume flame speed to be: %f m/s\n', S);
delta = alpha / S;
fprintf('\tEstimated flame thickness: %f mm\n', delta*1000);

fprintf('=============================================\n');
