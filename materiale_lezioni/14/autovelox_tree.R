library(tree)
autovelox <- read.csv("autovelox.csv")
autovelox$Multa <- as.factor(autovelox$Multa)

autovelox$Differenza <- autovelox$Velocita - autovelox$Limite
tree.autovelox <- tree(Multa ~ Differenza, autovelox)

plot(tree.autovelox)
text(tree.autovelox, pretty = 0)

tree.autovelox

predict(tree.autovelox,
        data.frame(Differenza = 10))

predict(tree.autovelox,
        data.frame(Differenza = -2))


predict(tree.autovelox,
        data.frame(Differenza = 80))



tree.autovelox <- tree(Multa ~ Velocita+Limite, autovelox)

plot(tree.autovelox)
text(tree.autovelox, pretty = 0)