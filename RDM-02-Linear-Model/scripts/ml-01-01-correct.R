# 請計算出iris的三種花的種類，所帶有的平均Sepal.Length
answer_01 <- local({
  data(iris)
  res = NULL
  for(sp in unique(iris$Species)) {
	res = rbind(res, data.frame(Species = sp, avg.Sepal.Length = mean(iris$Sepal.Length[iris$Species==sp])))
  }
  res})

stopifnot(is.data.frame(answer_01))
stopifnot(colnames(answer_01) == c("Species", "avg.Sepal.Length"))
stopifnot(sum(answer_01[[2]]) == 17.53)

# 完成後，請同學存檔並回到console輸入：`submit()`
