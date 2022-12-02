library(tidyverse)


ggplot(mpg, aes(x=hwy)) +
  geom_histogram()

ggplot(mpg) +
  geom_histogram(aes(x=hwy))

mpg %>% 
  filter(manufacturer == "volkswagen") %>% 
ggplot() +
  geom_histogram(aes(x=hwy))

# ONE Variable Continuous
summary(mpg$hwy)
ggplot(mpg, aes(hwy, fill=class)) +
  geom_histogram()

ggplot(mpg, aes(hwy)) +
  geom_area(stat="bin")

ggplot(mpg, aes(hwy)) +
  geom_density()

ggplot(mpg, aes(hwy)) +
  geom_histogram() +
  geom_freqpoly() 
  

# ONE Variable Discrete
table(mpg$fl)
ggplot(mpg, aes(fl)) +
  geom_bar()

ggplot(mpg, aes(trans)) +
  geom_bar()

ggplot(mpg, aes(trans, fill=fl)) +
  geom_bar()

ggplot(mpg, aes(trans)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 90))

nrow(mpg)
head(mpg, 2)

ggplot(mpg, aes(trans)) +
  geom_bar() +
  coord_flip()

mpg %>% 
  group_by(trans) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(5) %>% 
ggplot() +
  geom_col(aes(n, trans))

df <- data.frame(brand=c("audi", "mercedes", "fiat"), 
                 vendite=c(10, 50, 4))

ggplot(df) +
  geom_col(aes(brand, vendite))

df$brand <- factor(df$brand, levels=c("mercedes", "audi", "fiat"))

ggplot(df) +
  geom_col(aes(brand, vendite))


ggplot(mpg, aes(fct_infreq(trans))) +
  geom_bar() +
  coord_flip()

ggplot(mpg, aes(fct_rev(fct_infreq(trans)))) +
  geom_bar() +
  coord_flip()

# TWO Variables continuous x - continuous y
ggplot(mpg, aes(cty, hwy)) +
  geom_point()

ggplot(mpg, aes(cty, hwy, color=class)) +
  geom_point()

ggplot(mpg, aes(cty, hwy)) +
  geom_smooth(method="lm")

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
       caption = "Qui va la fonte dati")

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
  scale_color_manual(values = c("#CC6666", "#7777DD", "black"))

ggplot(mpg, aes(hwy)) +
  geom_histogram(aes(fill=drv)) +
  scale_fill_manual(values = c("#CC6666", "#7777DD", "black"))


ggplot(mpg, aes(cty, hwy)) +
  geom_point(aes(color=year))

ggplot(mpg, aes(cty, hwy)) +
  geom_point(aes(color=year)) +
  scale_color_continuous(low="grey", high="red")

## Extra ----

mcor <- cor(mtcars)
# Print mcor and round to 2 digits
round(mcor, digits = 2)
library(corrplot)

corrplot(mcor)
corrplot(mcor, method = "square")
corrplot(mcor, method = "square", order="AOE")


