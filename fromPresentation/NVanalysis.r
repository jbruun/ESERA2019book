setwd("~/OneDrive - Københavns Universitet/ESERA2019")
library(igraph)
NV04<-read.graph("NV_04.net",format="pajek")
NV07<-read.graph("NV_07.net",format="pajek")
NV10<-read.graph("NV_10-EN11199.net",format="pajek")

IM04<-read.csv("NV_04_dir.clu",sep=";")
IM07<-read.csv("NV_07_dir.clu",sep=";")
IM10<-read.csv("NV_10_dir.clu",sep=";")

V(NV04)$IM<-IM04[,1]
V(NV07)$IM<-IM07[,1]
V(NV10)$IM<-IM10[,1]

im04<-infomap.community(NV04)
im07<-infomap.community(NV07)
im10<-infomap.community(NV10)

hyp04<-which(V(NV04)$name=="hypotese")
hyp07<-which(V(NV07)$name=="hypotese")
hyp10<-which(V(NV10)$name=="hypotese")

pr10<-page.rank(NV10)$vector
flow<-vector()
for(i in 1:length(unique(V(NV10)$IM))){
flow[i]<-sum(pr10[V(NV10)$IM==i])
}

NV10_1<-V(NV10)$name[V(NV10)$IM==1]

#IDENTITY
#fysik forskellighed
#NV04 er det 1
#NV07 er det 1
#NV10 er det 1
