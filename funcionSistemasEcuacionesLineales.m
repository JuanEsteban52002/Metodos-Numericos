function [iteraciones, errores] = funcionSistemasEcuacionesLineales(A, b, x0, numIteraciones)
    % Inicialización
    n = length(b);
    x = x0;
    iteraciones = zeros(numIteraciones, n);
    errores = zeros(numIteraciones, n);
    
    for iter = 1:numIteraciones
        x_prev = x; % Guardar el valor anterior de x para calcular el error
        
        % Realizar la iteración de Gauss-Seidel
        for i = 1:n
            sum = b(i);
            for j = 1:n
                if i ~= j
                    sum = sum - A(i, j) * x(j);
                end
            end
            x(i) = sum / A(i, i);
        end
        
        % Almacenar la iteración y calcular el error
        iteraciones(iter, :) = x;
        errores(iter, :) = abs(x - x_prev);
    end
    
    % Recortar las matrices de iteraciones y errores si es necesario
    if iter < numIteraciones
        iteraciones = iteraciones(1:iter, :);
        errores = errores(1:iter, :);
    end
end
