function [polinomio, tablaDiferencias] = funcionInterpolacionNewton(xi, yi)
    n = length(xi);
    tablaDiferencias = zeros(n, n);
    tablaDiferencias(:,1) = yi(:); % Asegurarse de que yi sea una columna
    
    % Calcular la tabla de diferencias divididas
    for j = 2:n
        for i = 1:n-j+1
            tablaDiferencias(i,j) = (tablaDiferencias(i+1,j-1) - tablaDiferencias(i,j-1)) / (xi(i+j-1) - xi(i));
        end
    end
    
    % Extraer los coeficientes b0, b1, ..., bn
    coeficientes = diag(tablaDiferencias);
    
    % Construir el polinomio de Newton
    syms x; % Variable simbólica para el polinomio
    polinomio = coeficientes(1);
    terminoProducto = 1; % Inicializar el término de producto acumulativo
    
    for k = 2:n
        terminoProducto = terminoProducto * (x - xi(k-1));
        polinomio = polinomio + coeficientes(k) * terminoProducto;
    end
end
