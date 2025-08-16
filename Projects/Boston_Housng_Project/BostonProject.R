library(MASS)
library(tidyverse)
library(caret)
library(corrplot)
library(randomForest)

data(Boston)
head(Boston)

str(Boston)

summary(Boston$medv)
corrplot(cor(Boston),method="number")


ggplot(Boston,aes(x=rm,y=medv))+
  geom_point(color="blue")+
  geom_smooth(method="lm",se=TRUE,color="red")

#geom_smooth(method = "lm", se = FALSE, color = "red")
#geom_smooth() → adds a smooth curve or line of best fit.
#method = "lm" → tells it to use a linear model (straight regression line).
#se = FALSE → removes the shaded confidence interval (uncertainty band) around the line.
#color = "red" → makes the regression line red.



trainIndex <- createDataPartition(Boston$medv,p=0.8,list=FALSE)
trainIndex
train <- Boston[trainIndex,]
test <- Boston[-trainIndex,]

lm_moldel <- train(medv ~ .,data=train,method = "lm")

rf_model <- train(medv ~ .,data = train,method="rf",trControl= trainControl(method="cv",number=5))


lm_preds <- predict(lm_moldel,test)
tf_preds <- predict(rf_model,test)


lm_rmse <- RMSE(lm_preds,test$medv)
rf_rmse <- RMSE(tf_preds,test$medv)


lm_rmse
rf_rmse


results <- data.frame(
  Actual = test$medv,
  LM_Predicted = lm_preds,
  RF_Predicted = tf_preds
)
head(results)



# 1: nrow(results)
ggplot(results,aes(x=1:nrow(results)))+
  geom_line(aes(y=Actual,color="Actual"),size=1)+
  geom_line(aes(y=LM_Predicted,color="LM"),size=1)+
  geom_line(aes(y=RF_Predicted,color="RF"),size=1)+
  theme_minimal()+
  labs(
    title= "Actual vs LM vs predictions",
    x = "Observation",
    y = "medv ($1000s)",
    color = "Legend"
  )

