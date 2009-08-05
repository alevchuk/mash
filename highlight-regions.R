#!/usr/bin/env Rscript

suppressPackageStartupMessages(library(Biostrings))

data(BLOSUM45)
data(BLOSUM50)
data(BLOSUM62)
data(BLOSUM80)
data(BLOSUM100)


#
# Substitution matix
#

B = BLOSUM62

row.names(B)[row.names(B) == "*"] <- '-'
colnames(B)[colnames(B) == "*"] <- '-'



#
# Allignment Data
#

mult_align <- read.AAStringSet(file("stdin"), "fasta")



#
# Calculate Consensus
#

## Too slow
#most_frequent        <- function(x){names(which.max(table(x)))}
#most_frequent_nongap <- function(x){names(which.max(table(x[x != "-"])))}
#consensus_vector <- apply(as.matrix(mult_align), 2, most_frequent)

consensus_matrix <- consensusMatrix(mult_align, baseOnly=T, freq=T)
consensus_vector <- apply(consensus_matrix,2, function(x){names(which.max(x))})
consensus_intensity_vector <- apply(consensus_matrix,2, function(x){max(x)})

# The following can also be used, but it's a 50% + 1 consensus,
# which is much more restictive compared to the above most-frequent-consensus
### consensusString(mult_align)



# 
# Consensus in a custom data structure
# (per AA list; indexes only; NO gaps)
#

aanames <- rownames(B)[rownames(B) != '-'] # No gaps in consensus
consensus <- lapply(aanames, function(i){which(consensus_vector == i)})
names(consensus) <- aanames



#
# Calulate agreement of indiviual members to the consensus
#

tmp_matrix = as.matrix(mult_align)

get_scores = function(x){
  cons_letter <- x

  if(length(x) == 0){return(x)}

  positions   <- as.vector(consensus[[cons_letter]])
  scores_for_one_aa <- as.matrix(tmp_matrix[,positions])

  lookup_blosum = function(x){B[x, cons_letter]}
  result_matrix <- t(apply(scores_for_one_aa, 1, lookup_blosum))
  if (dim(result_matrix)[1] == 1) {result_matrix <- t(result_matrix)}
  colnames(result_matrix) = positions

  return(result_matrix)
}

scores = matrix(nrow=length(mult_align), ncol=0)
for(i in aanames) {
  new_scores = get_scores(i)
  if (length(new_scores) != 0) {scores = cbind(scores, new_scores)}
}

rm(tmp_matrix)



#
# Sort matrix by column name 
# (positions of non-gap consensus)
#

sorted_colnames <- sort(as.numeric(colnames(scores)))
scores <- scores[,as.character(sorted_colnames)]
consensus_vector <- consensus_vector[sorted_colnames]
consensus_intensity_vector <- consensus_intensity_vector[sorted_colnames]
#colnames(scores) <- sorted_colnames




#
# Output
#

w <- function(x, quote=F, row.names=F, col.names=F, append=T) {
  write.table(x, "",
    sep="\t", quote=quote, row.names=row.names,
    col.names=col.names, append=append)
}

w(t(consensus_vector), append=F)
w(t(consensus_intensity_vector))
w(t(colnames(scores)))
w(scores)

