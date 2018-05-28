%(a)
clear all;
close all;
N = 5;
xdata = linspace(0,1000, N+1);
ydata = randn([1, N+1]);
Cnewton = newpoly(xdata, ydata)
Clagrange = lagrinterpolde(xdata, ydata)

%(b)
N = 100;
xdata = linspace(0, 1000, N+1);
ydata = randn([1, N+1]);
tic
    Cnewton = newpoly(xdata, ydata);
toc

tic
    Clagrange = lagrinterpolde(xdata, ydata);
toc

%(c)
N = 10;
xdata = linspace(0,1000, N+1);
rng(0)
ydata = randn([1,N+1]);
Cnewton = newpoly(xdata,ydata);
Clagrange = lagrinterpolde(xdata,ydata);
x_plot_points = linspace(0,1000,500);
plot(xdata, ydata,'.')
figure(1)
plot(x_plot_points, polyval(Cnewton, x_plot_points ),'b')
plot(x_plot_points, polyval(Clagrange, x_plot_points), '-.r')

N = 30;
xdata = linspace(0,1000, N+1);
rng(0)
ydata = randn([1,N+1]);
Cnewton = newpoly(xdata,ydata);
Clagrange = lagrinterpolde(xdata,ydata);
x_plot_points = linspace(0,1000,500);
plot(xdata, ydata,'.')
figure(2)
plot( x_plot_points, polyval(Cnewton, x_plot_points ),'b')
plot( x_plot_points, polyval(Clagrange, x_plot_points), '-.r')

    