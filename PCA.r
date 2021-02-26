#Functions
center_scale <- function(x) {
    scale(x, scale = FALSE)
}
Save_Plots <- function(x=1,y=2) {
    P<-ggbiplot(PCA_Dat, choices= c(x,y), ellipse=TRUE, groups=Dat[1:101,1])
name <- sprintf("P%iP%i _plot.png", x,y)
png(name)
print(P)
dev.off()
}


# storing data in variable
Mydata <- read.table("IET.LUMO.dhd.LL.HH.BL.dist.dat", header=TRUE)
#Dat <- Mydata[-c(1)]
Dat <- Mydata
cat(" \n ________My Data Summary_______ \n \n" )
summary(Dat)
cat(" \n ________My Data Head_______ \n \n" )
head(Dat)

#Centering Data
Dat2 <- center_scale(Dat[-c(1)])
#head(Dat2)

#Correlation Matrix
C <- cor(Dat2)

cat( "\n _____Correlation Matrix______ \n \n")
print(C)

#SVD decompositon
#summary(Dat2)
PCA_Dat <- prcomp(Dat2, center=TRUE, scale. = TRUE)
cat(" \n ______PCA summary_______ \n\n")
summary(PCA_Dat)
cat( "\n _______PCA explicitly_____ \n\n" )
PCA_Dat
library(devtools)
library(ggbiplot)

print("...Printing plots")

Save_Plots(1,3)
Save_Plots(1,2)
Save_Plots(2,3)

print("...done")



