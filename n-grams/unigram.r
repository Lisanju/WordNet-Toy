library(udpipe)
library(readr)
library(writexl)

model <- udpipe_download_model(language = "portuguese")
model_path <- model$file_model
model_loaded <- udpipe_load_model(file = model_path)

corpora <- read_file("corpora.txt")

x <- udpipe_annotate(model_loaded, x = corpora, tagger = "default", parser = "none")
x <- as.data.frame(x)

unigram <- subset(x, upos %in% "NOUN")

unigram_data <- data.frame(
  token = c(unigram$token),
  lemma = c(unigram$lemma),
  postag = c(unigram$upos)
)

unigram_freq <- txt_freq(x = unigram$lemma)

unigram_freq <- data.frame(
  token = c(unigram_freq$key),
  freq = c(unigram_freq$freq)
)

write_xlsx(unigram_data, "C:\\Users\\User1\\Documents\\unigram_data.xlsx")
write_xlsx(unigram_freq, "C:\\Users\\User1\\Documents\\unigram_freq.xlsx")
