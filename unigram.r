library(udpipe)
library(readr)

model <- udpipe_download_model(language = "portuguese")
model_path <- model$file_model
model_loaded <- udpipe_load_model(file = model_path)

corpora <- read_file("corpora.txt")

x <- udpipe_annotate(model_loaded, x = corpora, tagger = "default", parser = "none")
x <- as.data.frame(x)

data <- data.frame(
  token = c(x$token),
  lemma = c(x$lemma),
  postag = c(x$upos)
)

data
