function myplot( x, y, varargin )
%Illusration of varargin using plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    plot(x, y, varargin{2:end});
    
    h = line([min(x) max(x)], [0 0]);
    set(h, 'color','r', 'LineStyle','-.')
    
    h = xlabel('$x$' );
    set(h,'Interpreter','latex', 'FontSize', 18);
    
    h = ylabel('$y$' );
    set(h,'Interpreter','latex', 'FontSize', 18);
    
    str = varargin{1};
    title(str, 'Interpreter','latex', 'fontsize',18, 'color','black');
end

