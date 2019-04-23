check_then_install("mlbench", "2.1.1") # 請同學安裝套件mlbench，版本為2.1.1或更新
library(mlbench)
data(BostonHousing)

# 同學應該先看看資料。請輸入：

# ?BostonHousing # 了解資料的背景
# sapply(BostonHousing, class) # 看看每欄的型態
# summary(BostonHousing) # 看看數字分佈
# nrow(BostonHousing) # 看看資料個數

# 請問這份資料的目標是哪一個變數？請閱讀說明文件後作答
answer_03_01 <- "medv"

# 第一回合：請同學做出一個R Squared超過0.9的模型
answer_03_02 <- local({
  lm(medv ~ .^2, BostonHousing)  
})
stopifnot(class(answer_03_02) == "lm")
stopifnot(summary(answer_03_02)$r.squared > 0.9)

# 第二回合：請同學做出一個AIC低於1089的模型
answer_03_03 <- local({
  step(answer_03_02, trace = 0)
})
stopifnot(class(answer_03_03) == "lm")
stopifnot(extractAIC(answer_03_03)[2] < 1089)
