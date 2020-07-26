function bayes = calc_bayes (prior_A, prob_B_dado_A, prob_B)
    bayes = (prior_A * prob_B_dado_A) / prob_B;
end