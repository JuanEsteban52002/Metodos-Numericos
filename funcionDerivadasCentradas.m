function [firstDeriv, secondDeriv, thirdDeriv] = funcionDerivadasCentradas(f, x, h)
    % Asumiendo que f es un handle a una función que acepta un valor escalar
    % y devuelve un valor escalar.

    % Primera derivada
    firstDeriv = (-f(x+2*h) + 8*f(x+h) - 8*f(x-h) + f(x-2*h)) / (12*h);

    % Segunda derivada
    secondDeriv = (-f(x+2*h) + 16*f(x+h) - 30*f(x) + 16*f(x-h) - f(x-2*h)) / (12*h^2);

    % Tercera derivada
    thirdDeriv = (-f(x+3*h) + 8*f(x+2*h) - 13*f(x+h) + 13*f(x-h) - 8*f(x-2*h) + f(x-3*h)) / (8*h^3);
end
