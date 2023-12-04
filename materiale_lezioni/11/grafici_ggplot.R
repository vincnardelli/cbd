library(ggplot2)
library(dplyr)
library(tidyverse)

# ONE Variable Continuous
summary(mpg$hwy)
ggplot(mpg, aes(hwy, fill=class)) +
  geom_histogram()

ggplot(mpg, aes(hwy)) +
  geom_area(stat="bin")

ggplot(mpg, aes(hwy)) +
  geom_density()

ggplot(mpg, aes(hwy)) +
  geom_freqpoly()

# ONE Variable Discrete
table(mpg$class)
ggplot(mpg, aes(class)) +
  geom_bar()

ggplot(mpg, aes(trans)) +
  geom_bar()

ggplot(mpg, aes(trans, fill=class)) +
  geom_bar()

ggplot(mpg, aes(trans)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90))

ggplot(mpg, aes(class)) +
  geom_bar() +
  coord_flip()

ggplot(mpg, aes(fct_infreq(class))) +
  geom_bar() +
  coord_flip()

ggplot(mpg, aes(fct_rev(fct_infreq(class)))) +
  geom_bar() +
  coord_flip()

# TWO Variables continuous x - continuous y
ggplot(mpg, aes(cty, hwy)) +
  geom_point()

ggplot(mpg, aes(cty, hwy, color=class)) +
  geom_point()

ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  geom_smooth(method="lm", se = F)

ggplot(mpg, aes(cty, hwy)) +
  geom_smooth()

ggplot(mpg, aes(cty, hwy)) +
  geom_smooth() +
  geom_point()

# TWO Variables - discrete x - continuous y
df_means = mpg %>%
  group_by(class) %>%
  summarize(hwy = mean(hwy))

ggplot(df_means, aes(x = class, y = hwy)) +
  geom_col()

ggplot(df_means, aes(x = fct_reorder(class, hwy), y = hwy)) +
  geom_col()

ggplot(mpg, aes(class, hwy)) +
  geom_boxplot()

ggplot(mpg, aes(fct_reorder(class, hwy, median), hwy)) +
  geom_boxplot()

# TWO Variables - date x - continuous y
ggplot(economics, aes(date, unemploy)) +
  geom_line()

ggplot(economics, aes(date, unemploy)) +
  geom_area()

# https://blog.albertkuo.me/post/2022-01-04-reordering-geom-col-and-geom-bar-by-count-or-value/

# Temi
ggplot(mpg, aes(hwy)) +
  geom_histogram() +
  theme_minimal()

ggplot(mpg, aes(hwy)) +
  geom_histogram() +
  theme_bw()

ggplot(mpg, aes(hwy)) +
  geom_histogram() +
  theme_classic()


# Labs
ggplot(mpg, aes(hwy)) +
  geom_histogram() +
  theme_minimal() +
  labs(title="Questo è il titolo", 
       subtitle="Questo è il sottotitolo", 
       caption = "Qui va la fonte dati") +
  xlab("Consumo") +
  ylab("Numero auto")

# Colori
ggplot(mpg, aes(hwy)) +
  geom_histogram(fill="red") 

ggplot(mpg, aes(hwy)) +
  geom_histogram(aes(fill=class))

ggplot(mpg, aes(cty, hwy)) +
  geom_point(color="red")

ggplot(mpg, aes(cty, hwy)) +
  geom_point(aes(color=class))


ggplot(mpg, aes(cty, hwy)) +
  geom_point(aes(color=drv)) +
  scale_color_manual(values = c("#e3776f", "#7777DD", "black"))

ggplot(mpg, aes(hwy)) +
  geom_histogram(aes(fill=drv)) +
  scale_fill_manual(values = c("#CC6666", "#7777DD", "black"))


ggplot(mpg, aes(cty, hwy)) +
  geom_point(aes(color=cty))

ggplot(mpg, aes(cty, hwy)) +
  geom_point(aes(color=year)) +
  scale_color_continuous(low="grey20", high="red")

