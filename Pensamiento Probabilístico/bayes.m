clc;        % limpiar consola
clear;      % borrar variables almacenadas en memoria
close all;  % cerrar ventanas abiertas

prob_cancer = 1 / 100000;
prob_sintoma_dado_cancer = 1;
prob_sintoma_dado_no_cancer = 10 / 99999;
prob_no_cancer = 1 - prob_cancer;

prob_sintoma = (prob_sintoma_dado_cancer * prob_cancer) + (prob_sintoma_dado_no_cancer * prob_no_cancer);

prob_cancer_dado_sintoma = calc_bayes(prob_cancer, prob_sintoma_dado_cancer, prob_sintoma);

prob_cancer_dado_sintoma