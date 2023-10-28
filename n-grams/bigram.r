library(udpipe)
library(readr)
library(writexl)

model <- udpipe_download_model(language = "portuguese")
model_path <- model$file_model
model_loaded <- udpipe_load_model(file = model_path)

corpora <- read_file("corpora.txt")

x <- udpipe_annotate(model_loaded, x = corpora, tagger = "default", parser = "none")
x <- as.data.frame(x)

bigram_token <- keywords_phrases(x$upos, term = x$token, pattern = c("NOUN", "ADJ"), sep = " ")
bigram_lemma <- keywords_phrases(x$upos, term = x$lemma, pattern = c("NOUN", "ADJ"), sep = " ")

bigram_data <- data.frame(
  tokens = c(bigram_token$keyword),
  lemmas = c(bigram_lemma$keyword),
  postags = c(bigram_token$pattern)
)

bigram_freq <- txt_freq(x = bigram_data$lemmas)

bigram_freq <- data.frame(
  lemmas = c(bigram_freq$key),
  freq = c(bigram_freq$freq)
)

write_xlsx(bigram_data, "dataframe/bigram_data.xlsx")
write_xlsx(bigram_freq, "dataframe/bigram_freq.xlsx")
