library(tidyverse)
# install.packages("ape")

# if (!require("BiocManager", quietly = TRUE))
  # install.packages("BiocManager")
# BiocManager::install("ggtree")
# BiocManager::install("ggtreeExtra")
# BiocManager::install("phyloseq")

# https://yulab-smu.top/treedata-book/chapter4.html

library(ape)
library(ggtree)
library(ggtreeExtra)
library(phyloseq)
load("tmp_tree_ref.Rdata", verbose = T)
plot(tree_ref)

as.phylo(tree_ref)

ggplot(tree_ref) + 
  geom_tree(color="black", size=1.5,
            ) + 
  theme_tree()

ggtree(tree_ref) + 
  # geom_treescale(fontsize=6, linesize=2, offset=-1.4)
  theme_tree2() +
  geom_tippoint(color = "black", 
                fill="#FDAC4F", shape=21, 
                size=3) +
  geom_tiplab(size=3, color="purple")

tree_ref$tip.label

load("../microeuks_deepbiosphere_datamine/microeuk-amplicon-survey/phyloseq-objs-180122.RData", verbose = T)
head(sample_data(wtax))
wtax <- merge_phyloseq(physeq_insitu, tree_ref)
plot_tree(wtax, color = "TYPE_SITE")
