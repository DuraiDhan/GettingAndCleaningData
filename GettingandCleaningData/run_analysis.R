library(data.table)
library(dplyr)

#main function
##directory as optional parameter
##note: loading data might take some time
runAnalysis<-function(dir=""){
  
  if(dir != "")
    setwd(dir);
    
  featuretable <-read.table("UCI HAR Dataset\\features.txt")
  testdata <-read.table("UCI HAR Dataset\\test\\x_test.txt")
  traindata <-read.table("UCI HAR Dataset\\train\\x_train.txt")
  

  #clean the column names remove "()", replace "(" with "_" and remvoe ")", replace"," with "_"
  cleanColumnNames<-function(featuretable){
    featuretable$V3 <- gsub("\\(\\)", "", featuretable$V2)
    featuretable$V3 <- gsub("\\(", "_", featuretable$V3)
    featuretable$V3 <- gsub("\\)", "", featuretable$V3)
    featuretable$V3 <- gsub(",", "_", featuretable$V3)
    
  }
  
  #merge the train and test dataset and put readable column name
  createMergedDataset<-function(featuretable,traindata,testdata){
    alldata<-rbind(traindata,testdata)
    colnames(alldata)<-featuretable
    alldata
  }

  #select only the wanted column which is passed as input
  createTidyDataset_Mean_STD<-function(mergeddata, columns, selectedCols){
    sel="mean|std";
    if(length(selectedCols) >0){
      sel<-paste(selectedCols, collapse="|")
    }
    #data ser contain duplicate colum which were not mean or std col, which can be removed
    duplicatedcols <- featuretable$V3[duplicated(featuretable$V3)]
    
    a<-mergeddata[,!(names(mergeddata) %in% duplicatedcols)]
    selectedCols <- grep(sel, columns, value = TRUE)
    # tidy_ds will contain wanted coluns to prepare final tidy data set
    tidy_ds<-select(a, one_of(selectedCols))
  }
  
  #write the tidy data set to file.
  SaveMeanOfTidyDataSet<-function(data_set, file="step5.txt"){
    
    write.table(colMeans(data_set),file,row.name=FALSE)
    
  }
  
  
  featuretab<-cleanColumnNames(featuretable)
  merged_ds<-createMergedDataset(featuretab,traindata,testdata)
  tidy_ds<-createTidyDataset_Mean_STD(merged_ds, featuretab,cols<-c("mean","std"))
  SaveMeanOfTidyDataSet(tidy_ds)
    
}



runAnalysis("C:\\Temp\\DSToolKit\\GettingandCleaningData\\")
