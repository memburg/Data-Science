function distancia = dist_euclidiana (nuevo, mejor_vendido)
    dim = size(nuevo, 2);
    distancia = 0;

    for i = 1: dim
        distancia += (nuevo(i) - mejor_vendido(i))^2;
    end

    distancia = sqrt(distancia);
end