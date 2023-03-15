library(seqinr)
library(ape)
library(msa)

# Read in sequences

ref_seqs <- readAAStringSet("../tmp_ref.fasta")

# Multiple sequence alignment

ref_align <- msa(ref_seqs)

# Distance matrix
## computes matrix of pairwise distances from aligned sequences using similarity - squared root of pairwise distances

ref_align_seq <- msaConvert(ref_align, type="seqinr::alignment")
ref_dist_align <- dist.alignment(ref_align_seq)

# Phylogenetic tree with neighbor joining
## BIONJ algorithm of Gascuel (1997)

tree_ref <- bionj(ref_dist_align)

save(tree_ref, file = "tmp_tree_ref.Rdata")
