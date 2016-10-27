# 請計算出iris中的三種花其各自的平均Sepal.Length
answer_01 <- local({
  
})

stopifnot(is.data.frame(answer_01))
stopifnot(colnames(answer_01) == c("Species", "avg.Sepal.Length"))
stopifnot(sum(answer_01[[2]]) == 17.53)

# 完成後，請同學存檔並回到console輸入：`submit()`
