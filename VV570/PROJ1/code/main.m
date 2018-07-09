clear all;
close all;
clc;

file_path = '../resource/clip.mp3';
info = audioinfo(file_path);
[y,Fs] = audioread(file_path);
L = 2000-1;
begin = 18000;
y = y(begin:begin+L); 
t = 0:length(y)-1;
p = 12;

%Autocorrelation
r = zeros(1, p+1);
for j = 1:p+1
    r(j) = calc_autocorrelation(y, j-1);
end
a = solve_toeplitz(r);
est = zeros(1, length(y));
for i = p+1:length(est)
    est(i) = a*y(i-p:i-1)';
end
err = y-est;
for i = 1:p
    err(i)=0;
end

plot(t, y)
xlabel('Time')
ylabel('Audio Signal')
hold on
plot(t, est)
hold off

