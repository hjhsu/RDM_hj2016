library(magrittr)
library(yaml)
library(git2r)

course_list <- dir(".", "lesson.yaml", full.names = TRUE, recursive = TRUE)
get_lecture_note <- function(course, out_dir = tempdir()) {
  
  from_text <- function(level, i) {
sprintf("

## stage %d

%s

", i, gsub("\\s", "", level$Output))
  }

  from_cmd_question <- function(level, i) {
sprintf("

## stage %d

%s

```r
%s
```

", i, gsub("\\s", "", level$Output), level$CorrectAnswer)
  }
  
  from_mult_question <- function(level, i) {
sprintf("

## stage %d

%s

%s
", i, gsub("\\s", "", level$Output), level$CorrectAnswer)
  }
  
  from_script <- function(level, i) {
    script_path <- file.path(dirname(course), "scripts", level$Script)
    correct_script_path <- file.path(dirname(course), "scripts", gsub(".R", "-correct.R", level$Script, fixed = TRUE))
    if (file.exists(correct_script_path)) {
      script <- readLines(correct_script_path, encoding="UTF-8")
    } else {
      script <- readLines(script_path, encoding="UTF-8")
    }
    script <- script %>%
      paste(collapse = "\n")
sprintf("

## stage %d

%s

```r
%s
```

", i, gsub("\\s", "", level$Output), script)
  }
    
  content <- yaml.load_file(course)
  retval <- character(0)
  for(i in seq_along(content) %>% tail(-1)) {
    content[[i]]$Output <- iconv(content[[i]]$Output, from="UTF-8", to="BIG5")
    operator <- get(sprintf("from_%s", content[[i]]$Class))
    retval %<>% append(operator(content[[i]], i - 1))
  }
  rmd_file <- tempfile(fileext = ".Rmd")
  write(retval, file = rmd_file)
  md_file <- tempfile(fileext = ".md")
  knitr::knit(rmd_file, md_file)
  # browser()
  html_file <- file.path(out_dir, sprintf("%s.html", dirname(course) %>% basename())) %>%
    gsub(pattern = "/./", replacement = "/", fixed = TRUE) %>%
    gsub(pattern = "^\\.", replacement = getwd()) %>%
    normalizePath(mustWork = FALSE)
#   html_file <- tempfile(fileext = ".html")
#   browser()
  rmarkdown::render(md_file, "html_document", html_file)
  invisible(html_file)
}

if (!file.exists("note")) dir.create("note")
htmls <- character(0)
for(i in seq_along(course_list)) {
  htmls %<>% append(get_lecture_note(course_list[i], "./note"))
}

