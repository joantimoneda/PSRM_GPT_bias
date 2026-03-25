# Title:  Replication Code - Is ChatGPT Conservative or Liberal? (Abortion Case)
# Author: Joan Timoneda
# Date:   May 2024

rm(list=ls())

library(lme4)
library(readxl)
library(arm)
library(stargazer)

setwd("") # Set to the directory containing the data files

data <- read_excel("data_abortion.xlsx")

colnames(data)

# Factor DV and reference category
data$language <- as.factor(data$language)
data$language <- relevel(data$language, ref = "polish")


## MODEL

mlmod <- glmer(cat_num_binary ~ language + (-1 + language|model), family=binomial("logit"), data=data)
summary(mlmod)
ranef(mlmod)
se.ranef(mlmod)

coefs_mlmod <- coef(mlmod)$model
coefs_mlmod <- coefs_mlmod[,-2]
coefs_mlmod

se_coefs_mlmod <- se.coef(mlmod)[[2]]


## FIGURES


## SWEDISH AND POLISH
coefs_mlmod_sp <- coefs_mlmod[,c(1,3)]
se_coefs_mlmod_sp <-se_coefs_mlmod[,c(1,3)]

#pdf("../../Bias_gpt3_4_sw_po_predprob.pdf", width=3, height=3)
# Eveything looks small because I export as only 3x3, fits better like that in .pdf
plot(x=NULL, y=NULL, xlim=c(0,0.5), ylim=c(0.35,0.75), type="n", main="", 
     xlab="Model", ylab="Probability of a Liberal Response", xaxt = "n",yaxt = "n", line=1.5, cex.main=0.5,
     cex.lab=0.5, bty="l")
axis(1, at=c(0.1, 0.4), labels=c("GPT-3.5", "GPT-4"), cex.axis=0.4)
axis(2, at=c(seq(0.4,1,0.1)), las=1, cex.axis=0.4)
for(i in 1:2){
  coefs <- coefs_mlmod_sp[,i]
  points(0.1, invlogit(as.double(coefs[1])), col=i+1,  pch=19, cex=0.4)
  points(0.4, invlogit(as.double(coefs[2])), col=i+1,  pch=19, cex=0.4)
  
  se <- se_coefs_mlmod_sp[,i]
  segments(0.1, invlogit(as.double(coefs[1] - se[1]*2.58)),
           0.1, invlogit(as.double(coefs[1] + se[1]*2.58)),
           col=i+1, lty=1, lwd=1.5)
  segments(0.4, invlogit(as.double(coefs[2] + se[2]*2.58)),
           0.4, invlogit(as.double(coefs[2] - se[2]*2.58)),
           col=i+1, lty=1, lwd=1.5)
}

legend(0.05,0.75, c("Swedish", "Polish"), cex=0.4, lty = 1, col=c(3, 2),bty='n')
#dev.off()



## ENGLISH
coefs_mlmod_en <- coefs_mlmod[,c(2)]
se_coefs_mlmod_en <- se_coefs_mlmod[,c(2)]

#pdf("../../Bias_gpt3_4_en.pdf", width=3, height=3)

plot(x=NULL, y=NULL, xlim=c(0,0.5), ylim=c(0.4,1), type="n", main="", 
     xlab="Model", ylab="", xaxt = "n",yaxt = "n", line=1.5, cex.main=0.5,
     cex.lab=0.5, bty="l")
axis(1, at=c(0.1, 0.4), labels=c("GPT-3.5", "GPT-4"), cex.axis=0.4)
axis(2, at=c(seq(0.4,1,0.1)), las=1, cex.axis=0.4)

points(0.1, invlogit(as.double(coefs_mlmod_en[1])), col=4,  pch=19, cex=0.4)
points(0.4, invlogit(as.double(coefs_mlmod_en[2])), col=4,  pch=19, cex=0.4)

segments(0.1, invlogit(as.double(coefs_mlmod_en[1] - se_coefs_mlmod_en[1]*1.96)),
         0.1, invlogit(as.double(coefs_mlmod_en[1] + se_coefs_mlmod_en[1]*1.96)),
         col=4, lty=1, lwd=1.7)
segments(0.4, invlogit(as.double(coefs_mlmod_en[2] - se_coefs_mlmod_en[2]*1.96)),
         0.4, invlogit(as.double(coefs_mlmod_en[2] + se_coefs_mlmod_en[2]*1.96)),
         col=4, lty=1, lwd=1.7)


legend(0.05,1, c("English"), cex=0.4, lty = 1, col=c(4), bty='n')
#dev.off()


## TABLE: 

summary(mlmod) 
ranef(mlmod) 
se.ranef(mlmod)






