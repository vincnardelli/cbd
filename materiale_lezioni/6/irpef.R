reddito <- 45000

if (reddito <= 15000) {
  imposta_2023 <- reddito * 0.23
} else if (reddito <= 28000) {
  imposta_2023 <- 15000 * 0.23 + (reddito - 15000) * 0.25
} else if (reddito <= 50000) {
  imposta_2023 <- 15000 * 0.23 + (28000 - 15000) * 0.25 + (reddito - 28000) * 0.35
} else {
  imposta_2023 <- 15000 * 0.23 + (28000 - 15000) * 0.25 + (50000 - 28000) * 0.35 + (reddito - 50000) * 0.43
}

aliquota_totale_2023 <- (imposta_2023 / reddito) * 100



if (reddito <= 28000) {
  imposta_2024 <- reddito * 0.23
} else if (reddito <= 50000) {
  imposta_2024 <- 28000 * 0.23 + (reddito - 28000) * 0.35
} else {
  imposta_2024 <- 28000 * 0.23 + (50000 - 28000) * 0.35 + (reddito - 50000) * 0.43
}

aliquota_totale_2024 <- (imposta_2024 / reddito) * 100