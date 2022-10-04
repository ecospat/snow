require(raster)

###function
SCD_GLM<-function(i){
  pixval<-extract(NDSI_bin, i, layer =1, nl = nlayers(NDSI_bin))
  pixval<-as.numeric(pixval)
  if(sum(!is.na(pixval))==0){
    val<-NA
  }else{
    x<-as.data.frame(cbind(pixval,doy))
    x<-na.omit(x)
    m<-glm(pixval~doy,data=x,family=binomial)
    xw=0:365
    pred<-predict.glm(m, newdata=list(doy=xw),
                      type="response")
    if(min(pred)>0.5){
      val<-365
    } else{
      val<-min(which(pred < 0.7))
    }
    return(val)
  }
}

### Data prep
l<-list.files(path=paste0(".../"),full.names = T,pattern = ".tif")# load NDSI files (EX GEE)
NDSI<-stack(l[1:length(l)])# stack NDSI files


### Binarisation of the individual NDSI images
NDSI_bin<-stack()
th <- 0.15 # Threshold for binarisation
t <- c(-1,th,1)
for (i in 1:nlayers(NDSI)) {
  x <- NDSI[[i]]
  x <- cut(x,breaks=t)
  subdf <- data.frame(from=c(1,2), to=c(0,1))
  layer <- NDSI[[i]]
  x <- subs(x, subdf, subsWithNA=TRUE)
  NDSI_bin <- stack(NDSI_bin,x)
}
names(NDSI_bin) <- names(NDSI)

### Day of the year
doy<-names(NDSI)#if the name of the layers contains the date at which the images was taken


###Run GLM on each pixel
SCD<-NDSI_bin[[1]]
values(SCD)<-NA
idcell<-1:ncell(SCD)
VAL<-unlist(lapply(idcell,SCD_GLM))
values(SCD)[idcell]<-VAL
plot(SCD)

