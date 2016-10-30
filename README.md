#DSC 2016 系列活動 R語言資料探勘實務 
##[本頁網址 http://tinyurl.com/RDM-hj2016](http://tinyurl.com/RDM-hj2016) <p>
##請自行安裝 R(3.2.3 版以上), RStudio

---
##簡易啟動
install_course_github("hjhsu", "RDM_hj2016", "course") <p>
swirl()

---
##須知
- 請檢查是否使用`http://wush978.github.io`上的swirl套件：

```
tryCatch({
  # Error if we need to install swirl
  if (!"swirl" %in% rownames(installed.packages())) stop("install swirl")
  if (packageVersion("swirl") < package_version("101.3.1.5")) stop("install swirl")
}, error = function(e) {
  if (conditionMessage(e) == "install swirl") {
    install.packages("swirl", repos = "http://wush978.github.io/R")
  }
})
```

- 載入swirl，並且安裝課程
```
library(swirl)
install_course_github("hjhsu", "RDM_hj2016", "course")
```

- 如果安裝有問題，請清空過往課程
```
library(swirl)
delete_progress("user_name") # 修該user_name成為同學的暱稱
uninstall_all_courses() # 移除所有舊課程
install_course_github("wush978", "StatMLDM", "course")
```
## 講義
[RDataMining](https://hjhsu.github.io/RDM_hj2016/RDataMining.pdf)

---
## 課程筆記 <p>
[RDM-01 Association Rules](https://hjhsu.github.io/RDM_hj2016/note/RDM-01-Association-Rule.html) <p>
[RDM-02 Linear Model](https://hjhsu.github.io/RDM_hj2016/note/RDM-02-Supervised-Learning-01-Linear-Model.html) <p>
[RDM-03 Generalized Linear Model](https://hjhsu.github.io/RDM_hj2016/note/RDM-03-Supervised-Learning-02-Generalized-Linear-Model.html) <p>
[RDM-04 Clustering](https://hjhsu.github.io/RDM_hj2016/note/RDM-04-Unsupervised-Learning-Clustering.html) <p>
[RDM-05 Classification](https://hjhsu.github.io/RDM_hj2016/note/RDM-05-Classification.html) <p>


