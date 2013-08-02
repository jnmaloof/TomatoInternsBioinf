eval.go <- function(lrt,ilength,go.terms,verbose=FALSE,p.thresh=.05,FC.thresh=0,
                    go.cutoff=.05,keep.GO="BP",type="GO") {
  require(goseq)
  require(GO.db)
  gene.names <- row.names(topTags(lrt,n=Inf)$table)  
  
  #add GO: header if needed
  head(go.terms)
  if (type=="GO" & length(grep("GO",go.terms$GO[1]))==0) {
    go.terms$GO <- gsub("([0-9]{7})","GO:\\1",go.terms$GO)
  }
  
  #remove extra spaces
  go.terms$GO <- gsub(" +","",go.terms$GO)
  
  #get length list to match gene names
  ilength <- ilength[names(ilength) %in% gene.names]
  
  #filter go terms to match gene list
  go.terms <- go.terms[go.terms$ITAG %in% gene.names,]
  #head(go.terms)
  
  #convert go terms to list
  go.list <- strsplit(as.character(go.terms$GO),split=",")
  head(go.list)
  names(go.list) <- go.terms$ITAG
  
  if(length(lrt$comparison)>1) { #means that we should just use the p.value and not worry about up vs down
    pval <- topTags(lrt,n=Inf)$table$adj.P.Val
    
    #filter genes based on criterion
    de <- as.integer(pval < p.thresh) #DE genes
    names(de) <- gene.names
    
    if (verbose) {
      print(summary(de))
    }
    
    #calculate bias function
    de.pwf <- nullp(de,bias.data=ilength,plot.fit=F)
    
    #calculate p-values for over-representation
    de.go <- goseq(de.pwf,gene2cat=go.list)
    
    if (type=="GO") {#add GO term description
      de.go$description <- Term(de.go$category)
      de.go$ontology <- Ontology(de.go$category)
      
      #filter for GO categories of interest
      de.go <- de.go[de.go$ontology==keep.GO,]
      
      #remove NAs
      de.go <- de.go[!is.na(de.go$ontology),]
    }  
    
    #adjust for multiple testing
    de.go$over.pval.adjust <- p.adjust(de.go$over,"fdr")
    
    #truncate to go.cutoff threshold
    de.go <- de.go[de.go$deval<go.cutoff,]
    
    list(de=de.go)
    
  } else {
    
    pval <- topTags(lrt,n=Inf)$table$adj.P.Val
    FC <- topTags(lrt,n=Inf)$table[,2]
    
    #filter genes based on criterion
    up <- as.integer(FC > FC.thresh & pval < p.thresh) #upregulated genes
    names(up) <- gene.names
    down <- as.integer(FC < - FC.thresh & pval < p.thresh) #downregulated genes
    names(down) <- gene.names
    
    if (verbose) {
      print(summary(up))
      print(summary(down))
    }
    
    #calculate bias function
    up.pwf <- nullp(up,bias.data=ilength,plot.fit=F)
    down.pwf <- nullp(down,bias.data=ilength,plot.fit=F)
    
    #calculate p-values for over-representation
    up.go <- goseq(up.pwf,gene2cat=go.list)
    down.go <- goseq(down.pwf,gene2cat=go.list)
    
    if (type=="GO") {#add GO term description
      up.go$description <- Term(up.go$category)
      up.go$ontology <- Ontology(up.go$category)
      down.go$description <- Term(down.go$category)
      down.go$ontology <- Ontology(down.go$category)
      
      #filter for GO categories of interest
      up.go <- up.go[up.go$ontology==keep.GO,]
      down.go <- down.go[down.go$ontology==keep.GO,]
      
      #remove NAs
      up.go <- up.go[!is.na(up.go$ontology),]
      down.go <- down.go[!is.na(down.go$ontology),]
    }	
    
    #adjust for multiple testing
    up.go$over_pval.adjust <- p.adjust(up.go$over,"fdr")
    down.go$over_pval.adjust <- p.adjust(down.go$over,"fdr")
    
    #truncate to go.cutoff threshold
    up.go <- up.go[up.go$upval<go.cutoff,]
    down.go <- down.go[down.go$upval<go.cutoff,]
    
    list(up=up.go,down=down.go)
  }
  
}