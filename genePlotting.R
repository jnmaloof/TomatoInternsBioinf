lrt.temp.ArcVsLyc <- glmLRT(dge, fit, coef=5)
topTags(lrt.temp.ArcVsLyc)
sum(topTags(lrt.temp.ArcVsLyc,n=Inf)$table$adj.P.Val < 0.01)


lrt.temp.HabVsLyc <- glmLRT(dge, fit, coef=6)
topTags(lrt.temp.HabVsLyc)
sum(topTags(lrt.temp.HabVsLyc,n=Inf)$table$adj.P.Val < 0.01)

results.temp.ArcVsLyc <- merge(topTags(lrt.temp.ArcVsLyc)$table,HRD,by.x="row.names",by.y="ITAG",all.x=T,all.y=F,sort=F)
head(results.temp.ArcVsLyc)
#how to save the annotated file?
write.csv(results.temp.ArcVsLyc,file="results.temp.ArcVsLyc.csv")


library(ggplot2)
library(reshape)

#to plot a single gene
gene <- "Solyc03g116390.2.1"
counts <- melt(cpm(dge)[gene,])
counts$species <- species
counts$temp <- temp

pl <- ggplot(counts,aes(x=species,y=value,fill=temp))
pl <- pl + geom_bar(stat="summary",fun.y=mean,position="dodge")
pl

#alternative using boxplots:
pl <- ggplot(counts,aes(x=species,y=value,fill=temp))
pl <- pl + geom_boxplot()
pl

#to plot several genes, say the top from topTags
genes <- row.names(topTags(lrt.temp.ArcVsLyc)$table)[1:10]
counts <- melt(cpm(dge[genes,]))
colnames(counts)[1:2] <- c("gene","sample")
counts$species <- substr(counts$sample,1,3)
counts$temp <- substr(counts$sample,5,6)
counts$temp <- sub("8.","8",counts$temp,fixed=T)
counts

pl <- ggplot(counts,aes(x=species,y=value,fill=temp))
pl <- pl + geom_bar(stat="summary",fun.y=mean,position="dodge")
pl <- pl + facet_wrap(~ gene,nrow=2,scales="free")
pl

#alternative using boxplots
pl <- ggplot(counts,aes(x=species,y=value,fill=temp))
pl <- pl + geom_boxplot()
pl <- pl + facet_wrap(~ gene,nrow=2,scales="free")
pl