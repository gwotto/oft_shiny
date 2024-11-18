## 2020-07-09 convert data to


library(reticulate)
library(tidyverse)

## Seeing your enviroments  
conda_list()

## Using environment miniconda3
conda_list()[[1]][1] %>%    
  use_condaenv(required = TRUE)

## Checking python

platform <- import('platform')

## Error in platform.system() : could not find function
## "platform.python_version"
print(platform.python_version())


library(Seurat)
library(sceasy)


load(file = 'heart-data-cxcr4.RData', verbose =TRUE)

sceasy:::convertFormat(heart.data.cxcr4, from="seurat", to="anndata",
                       outFile='heart-data-cxcr4.h5ad')


#### 2024-11-18 update Seurat object to a Seurat v4


heart.data.cxcr4 <- UpdateSeuratObject(heart.data.cxcr4)
save(heart.data.cxcr4, file="data/heart-data-cxcr4.RData")
