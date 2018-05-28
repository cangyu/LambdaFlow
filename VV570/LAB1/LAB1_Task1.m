%(a)
x=[1, 2, 3, 4, 5, 6];
y=[66, 66, 65, 64, 63, 63];

lagrinterpol(x, y, 4.5)

%(b)
poly([2,3,5,7,9])

%(c)
syms s;
f = (s-2)*(s-7)*(s-1)*(s-8)*(s-2)*(s-8);
expand(f)

%(d)
a=[2, 7, 1, 8, 2, 8];
P=poly([a(1), a(2), a(3)]);
Q = poly([a(4), a(5), a(6)]);
conv(P, Q)

%(e)
coeff=[a(1), a(2), a(3)];
polyval(coeff, [a(4), a(5), a(6)])

%(f)
[c0, c1] = lagrinterpolde(x, y)
xs = linspace(1,6,100);
yder = polyval(c1, xs);
plot(xs, yder)








