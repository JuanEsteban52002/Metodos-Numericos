function [coeficientes, X, Y, X2, X3, X4, XY, X2Y, Y_calculado, Error] = funcionAjusteCuadratico(x, y)
    % Convierte los datos de entrada en vectores columna
    X = x(:);
    Y = y(:);
    
    % Calcula los términos necesarios para el ajuste cuadrático
    X2 = X.^2;
    X3 = X.^3;
    X4 = X.^4;
    XY = X.*Y;
    X2Y = X2.*Y;
    
    % Construye la matriz de diseño para el polinomio de segundo grado
    A = [sum(X4) sum(X3) sum(X2); sum(X3) sum(X2) sum(X); sum(X2) sum(X) length(X)];
    
    % Construye el vector del lado derecho
    B = [sum(X2Y); sum(XY); sum(Y)];
    
    % Resuelve el sistema de ecuaciones lineales para obtener los coeficientes
    coeficientes = A \ B;
    
    % Calcula los valores ajustados y el error
    Y_calculado = coeficientes(1)*X2 + coeficientes(2)*X + coeficientes(3);
    Error = Y - Y_calculado;
end
