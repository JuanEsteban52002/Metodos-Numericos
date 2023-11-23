function [x_solucion, M] = funcionNewtonRaphson(funcion, xi, criterioParada)
    format long;

    x = sym('x');  % Definir x como símbolo
    f = str2sym(funcion);  % Convertir la cadena de la función a una función simbólica
    df = diff(f, x);  % Calcular la derivada simbólica

    xi = str2double(xi);
    criterioDeParada = str2double(criterioParada);

    i = 0;
    x_solucion = xi;
    eA = 100;  % Inicializar eA antes del bucle

    while eA > criterioDeParada
        xi1 = x_solucion;
        fxi = double(subs(f, x, xi));  % Evaluar la función en xi
        dfxi = double(subs(df, x, xi));  % Evaluar la derivada en xi
        x_solucion = xi - fxi / dfxi;
        i = i + 1;

        if i == 1
            M(i, :) = [i, xi, fxi, dfxi, x_solucion, -1];
        else
            eA = abs(((x_solucion - xi1) / x_solucion) * 100);
            M(i, :) = [i, xi, fxi, dfxi, x_solucion, eA];
        end

        if eA <= criterioDeParada
            break;
        end

        xi = x_solucion;
    end
end
