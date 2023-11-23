function [M2, x, A, B, f] = funcionBiseccion(funcion, xi, xs, criterioParada)
    format long; clc;

    fa = funcion;
    f = str2func(['@(x)' fa]);

    i = 0;
    xi = str2double(xi);
    xs = str2double(xs);
    xr = (xi + xs) / 2;
    criterioDeParada = str2double(criterioParada);

    eA = 100;  % Inicializar eA antes del bucle

    while eA > criterioDeParada
        xr1 = xr;
        xr = (xi + xs) / 2;
        fxi = f(xi);
        fxr = f(xr);
        fxs = f(xs);
        i = i + 1;

        if i == 1
            M2(i, :) = [i, xi, xr, xs, fxi, fxr, fxs, -1];
            x = [xi, xs];
            
        else
            eA = abs(((xr1 - xr) / xr1) * 100);
            M2(i, :) = [i, xi, xr, xs, fxi, fxr, fxs, eA];
        end

        A(i) = xr;
        B(i) = fxr;

        if eA <= criterioDeParada
            break;
        end

        if fxi < 0 && fxr > 0
            xs = xr;
        elseif fxi > 0 && fxr < 0
            xs = xr;
        elseif fxr < 0 && fxs > 0
            xi = xr;
        elseif fxr > 0 && fxs < 0
            xi = xr;
        end
    end
end
