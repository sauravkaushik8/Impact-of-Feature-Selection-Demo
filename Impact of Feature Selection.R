library('Metrics')

library('randomForest')

library('ggplot2')

library('ggthemes')

library('dplyr')

#set random seed

set.seed(101)

#loading dataset

data<-read.csv("train.csv",stringsAsFactors= T)

#checking dimensions of data

dim(data)

## [1] 3000  101

#specifying outcome variable as factor

 

data$Y<-as.factor(data$Y)

data$Time<-NULL

#dividing the dataset into train and test

train<-data[1:2000,]

test<-data[2001:3000,]

#applying Random Forest

model_rf<-randomForest(Y ~ ., data = train)

 

preds<-predict(model_rf,test[,-101])

 

table(preds)

##preds

## -1   1

##453   547

 

#checking accuracy

auc(preds,test$Y)

##[1] 0.4522703


importance(model_rf)

#MeanDecreaseGini

##x1           8.815363

##x2          10.920485

##x3           9.607715

##x4          10.308006

##x5           9.645401

##x6          11.409772

##x7          10.896794

##x8           9.694667

##x9           9.636996

##x10          8.609218

…

…

##x87          8.730480

##x88          9.734735

##x89         10.884997

##x90         10.684744

##x91          9.496665

##x92          9.978600

##x93         10.479482

##x94          9.922332

##x95          8.640581

##x96          9.368352

##x97          7.014134

##x98         10.640761

##x99          8.837624

##x100         9.914497

 


model_rf<-randomForest(Y ~ X55+X11+X15+X64+X30

                          +X37+X58+X2+X7+X89

                          +X31+X66+X40+X12+X90

                          +X29+X98+X24+X75+X56,

                        data = train)

 

preds<-predict(model_rf,test[,-101])

 

table(preds)

##preds

##-1   1

##218 782

#checking accuracy

auc(preds,test$Y)

##[1] 0.4767592