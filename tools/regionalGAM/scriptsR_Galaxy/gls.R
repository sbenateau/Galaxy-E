#!/usr/bin/env Rscript
library(nlme)
library(MASS)

args = commandArgs(trailingOnly=TRUE)
input1 = read.table(args[1], header=TRUE) #input1=col.index =glmmpql-output
input2 = read.table(args[2], header=TRUE,sep="	") #input2=data.index =abundance_index-output

input1<-as.matrix(input1)

year <- unique(input2$YEAR)
mod <- gls(input1~year)
summary<-summary(mod)

save(mod, file = "mod.rda")
capture.output(summary, file="mod-summary.txt")
