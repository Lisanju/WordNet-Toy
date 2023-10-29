library(udpipe)
library(readr)
library(writexl)

model <- udpipe_download_model(language = "portuguese")
model_path <- model$file_model
model_loaded <- udpipe_load_model(file = model_path)

corpora <- read_file("corpora.txt")

x <- udpipe_annotate(model_loaded, x = corpora, tagger = "default", parser = "none")
x <- as.data.frame(x)

trigram_token <- keywords_phrases(x$upos, term = x$token, pattern = c("NOUN", "ADP", "NOUN"), sep = " ")
trigram_lemma <- keywords_phrases(x$upos, term = x$lemma, pattern = c("NOUN", "ADP", "NOUN"), sep = " ")

trigram_data <- data.frame(
  tokens = c(trigram_token$keyword),
  lemmas = c(trigram_lemma$keyword),
  postags = c(trigram_token$pattern)
)

trigram_freq <- txt_freq(x = trigram_data$lemmas)

trigram_freq <- data.frame(
  lemmas = c(trigram_freq$key),
  freq = c(trigram_freq$freq)
)

write_xlsx(trigram_data, "dataframe/trigram_data.xlsx")
write_xlsx(trigram_freq, "dataframe/trigram_freq.xlsx")
