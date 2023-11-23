function I = funcionSimpson38(f, a, b, n)
    % f: función a integrar, pasada como handle
    % a: límite inferior de integración
    % b: límite superior de integración
    % n: número de subintervalos (debe ser múltiplo de 3)
    
    if mod(n, 3) ~= 0
        disp('n debe ser un múltiplo de 3');
    end
    
    h = (b - a) / n;
    x = a:h:b;
    fx = arrayfun(f, x);
    
    I = 3*h/8 * (fx(1) + 3*sum(fx(2:3:n-1)) + 3*sum(fx(3:3:n)) + 2*sum(fx(4:3:n-2)) + fx(end));


end
