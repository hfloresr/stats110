# read in data set
sparrow <- read.csv("data/Sparrows.csv")

# create full model
fit <- lm("Weight ~ WingLength", data = sparrow)

# plot the data and regression line
plot(sparrow$WingLength, sparrow$Weight)
abline(fit, col='red')

# print out coeffs
print(fit)

# predict value for 30mm wing length
pred <- predict(fit, data.frame(WingLength = c(30)))
e_30 <- 16 - pred

# filter sparrow for control treatment only
sparrow_control <- sparrow[sparrow$Treatment == 'control', ]

# create model for control data
fit_control <- lm("Weight ~ WingLength", data=sparrow_control)

# plot control data and regression line
plot(sparrow_control$WingLength, sparrow_control$Weight)
abline(fit_control, col='red')

# print out coeffs
print(fit_control)

# predict value for 30mm wing length
pred_control <- predict(fit_control, data.frame(WingLength = c(30)))
e_control_30 <- 16 - pred_control