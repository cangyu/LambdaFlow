function ydot = butcher( t, y )
% ydot = butcher( t, y ) is the right side function for
% the ODE y'= (y+t)/(y-t) 
% t is the independent variable
% y is the dependent variable
% ydot is y?

ydot = (y+t)/(y-t) ;

end