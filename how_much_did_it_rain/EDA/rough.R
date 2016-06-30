

rm(train)
train <- fread('raw_data/train.csv')
train <- as.data.frame(train)
train_raw_tmp <- train[!is.na(train[,"Ref"]),]
allna_rows <- apply(train_raw_tmp[,4:23], 1 , function(x) all(is.na(x))) 
allna_rows_raw <- apply(train[,4:23], 1 , function(x) all(is.na(x))) 


### Marshall palmer script by Mlandry - Kaggle Scripts ####


mpalmer <- function(ref, minutes_past) {
  
  # order reflectivity values and minutes_past
  sort_min_index = order(minutes_past)
  minutes_past <- minutes_past[sort_min_index]
  ref <- ref[sort_min_index]
  
  # calculate the length of time for which each reflectivity value is valid
  valid_time <- rep(0, length(minutes_past))
  valid_time[1] <- minutes_past[1]
  if (length(valid_time) > 1) {
    for (i in seq(2, length(minutes_past))) {
      valid_time[i] <- minutes_past[i] - minutes_past[i-1]
    }
    valid_time[length(valid_time)] = valid_time[length(valid_time)] + 60 - sum(valid_time)
  } else {
    # if only 1 observation, make it valid for the entire hour
    valid_time <- 60
  }
  
  valid_time = valid_time / 60
  
  # calculate hourly rain rates using marshall-palmer weighted by valid times
  sum <- 0
  for (i in seq(length(ref))) {
    if (!is.na(ref[i])) {
      mmperhr <- ((10^(ref[i]/10))/200) ^ 0.625
      sum <- sum + mmperhr * valid_time[i]
    }
  }
  
  return(sum)
  
}

results <- train_raw_tmp %>% group_by(Id) %>% summarize(Expected=mpalmer(Ref, minutes_past))
names(results) <- c("Id","MPlmr")
train_raw_tmp <- merge(train_raw_tmp,results,by = "Id")

#####



##### function for density plots####
plot.multi.dens <- function(s)
{
  junk.x = NULL
  junk.y = NULL
  for(i in 1:length(s)) {
    junk.x = c(junk.x, density(s[[i]])$x)
    junk.y = c(junk.y, density(s[[i]])$y)
  }
  xr <- range(junk.x)
  yr <- range(junk.y)
  plot(density(s[[1]]), xlim = xr, ylim = yr, main = "")
  for(i in 1:length(s)) {
    lines(density(s[[i]]), xlim = xr, ylim = yr, col = i)
  }
}

# the input of the following function MUST be a numeric list
plot.multi.dens( list(as.numeric(train_raw_tmp[,"Expected"]), as.numeric(train_raw_tmp[,"MPlmr"]) ))





## Custom histogram function ####

myhist <- function(x, ..., breaks="Sturges",
                   main = paste("Histogram of", xname),
                   xlab = xname,
                   ylab = "Frequency") {
  xname = paste(deparse(substitute(x), 500), collapse="\n")
  h = hist(x, breaks=breaks, plot=FALSE)
  plot(h$breaks, c(NA,h$counts), type='S', main=main,
       xlab=xlab, ylab=ylab, axes=FALSE, ...)
  axis(1)
  axis(2)
  lines(h$breaks, c(h$counts,NA), type='s')
  lines(h$breaks, c(NA,h$counts), type='h')
  lines(h$breaks, c(h$counts,NA), type='h')
  lines(h$breaks, rep(0,length(h$breaks)), type='S')
  invisible(h)
}


#####
Uid <- unique(train_raw_tmp[,"Id"])
idx <- match(Uid,train_raw_tmp[,"Id"])

train_raw_tmp[idx,"Expect"]

lst <- lapply(split(train_raw_tmp[,c("Id","Expected")], "Id"), unique)
lst <- as.data.frame(lst)
names(lst) <- c("Id", "Expected")
lst2 <- lapply(split(train_raw_tmp[,c("Id","MPlmr")], "Id"), unique)
lst2 <- as.data.frame(lst2)
names(lst2) <- c("Id", "MPlmr")
lst <- merge(lst,lst2, by = "Id")

lst %>% select(-Id) %>% filter(Expected < 150) %>% ggplot(aes(y = abs(Expected - MPlmr),x  =  Expected )) + 
  geom_point(size = 0.5, alpha = 0.05)

## Good plot of marshall palmer vs Expected for less than 150
p <- ggplot(chk, aes(Expected, abs(Expected-MPlmr)))
p + geom_point(size = 0.5, alpha = 0.05) + 
  annotate("text", label = "For Expected < 150", x = 50, y = 150, size = 6, colour = "Blue")

## Create training set with following features:

### some broing feature ideas that are good to include but do not help the cause!: 
#- Number of records per Id, 
#- Number of Na's per Id, 
#- Id? (not directly correlated in this case with expected so left it out)
#- Any other meterological rain rate estimators based on other radar components. 

## Function for calculating time differences (David Lucas on Scripts) ---- XXXXX don't use. 

#Get the time differences between each measure
time_difference <- function(times, num_per_segment = 60) {
  n <- length(times)
  valid_time <- vector(mode="numeric", length = n)
  valid_time[1] <- times[1]
  valid_time[-1] <- diff(times, 1)
  valid_time[n] <- valid_time[n] + num_per_segment - sum(valid_time)
  valid_time <- valid_time / num_per_segment
  valid_time
}


## time difference by Mlandry 
tdiff_calc <- function(minutes_past) {
sort_min_index = order(minutes_past)
minutes_past <- minutes_past[sort_min_index]
valid_time <- rep(0, length(minutes_past))
valid_time[1] <- minutes_past[1]
if (length(valid_time) > 1) {
  for (i in seq(2, length(minutes_past))) {
    valid_time[i] <- minutes_past[i] - minutes_past[i-1]
  }
  valid_time[length(valid_time)] = valid_time[length(valid_time)] + 60 - sum(valid_time)
} else {
  # if only 1 observation, make it valid for the entire hour
  valid_time <- 60
}

valid_time = valid_time / 60

}
## My tdiff calc

mytdiff_calc <- function(minutes_past) {
  
  valid_time <- rep(0, length(minutes_past))
  valid_time[1] <- minutes_past[1]
  if (length(valid_time) > 1) {
    for (i in seq(2, length(minutes_past))) {
      valid_time[i] <- minutes_past[i] - minutes_past[i-1]
    }
    valid_time[length(valid_time)] = valid_time[length(valid_time)] + 60 - sum(valid_time)
  } else {
    # if only 1 observation, make it valid for the entire hour
    valid_time <- 60
  }
  
  valid_time = valid_time / 60
  
}



## sort data set by increasing minutes

tmp <- train_raw_tmp[order( train_raw_tmp$Id,train_raw_tmp$minutes_past),] 


##

valid_Expected <- 0.254 * 1:276

#train_raw_tmp$tdiff <- time_difference(train_raw_tmp$minutes_past) 

#tmp <- train_raw_tmp %>% group_by(Id) %>% summarize(tdiff = time_difference(minutes_past))

#as.data.frame(lapply(split(tmp[1:2000,],f =  "Id"), function(x){time_difference(x[,"minutes_past"])}))


tmp <- train_raw_tmp[order( train_raw_tmp$Id,train_raw_tmp$minutes_past),]


chk <- tmp %>% group_by(Id) %>% do(tdiff = time_difference(.$minutes_past))

#unlist(lapply(chk$tdiff , function(x) {x < 0}))
any(unlist(lapply(chk$tdiff , function(x) {x < 0})))


# check if the these Id's match the tmp. 
  all(rep(chk$Id, unlist(lapply(chk$tdiff , function(x) {length(x)})))==tmp$Id)   # YES!
  
# add the tdiff vector to tmp and call it valid_time
  tmp$valid_time <- unlist(chk$tdiff)

# Now use the valid time to define new features
  
  num_readings <- unlist(lapply(chk$tdiff , function(x) {length(x)}))
  num_nas <-  apply(tmp, 1 ,function(x){sum(is.na(x))})  # this is not useful here - do it for final dataset. 
  
   tmp <- tmp %>%  mutate(Ref_5x5_tpd = 10^(Ref_5x5_50th/10)*valid_time, 
                  Ref_composite_tpd = 10^(RefComposite/10)*valid_time,
                  RefComposite_5x5_tpd  = 10^(RefComposite_5x5_50th/10)*valid_time, 
                  Ref_tpd= 10^(Ref/10)*valid_time)  # Edited to include Ref (was forgrotten )
   
   tmp <- tmp %>% mutate(num_nas = num_nas)
  
  #Collapse to one record per Id - Just taking mean although in most cases I am just loading the unique value
  
    train_final <- tmp  %>% group_by(Id) %>% summarize(Expected = mean(Expected, na.rm = T), 
                                               MPlmr = mean(MPlmr, na.rm = T), 
                                               Ref_tpd = mean(Ref_tpd, na.rm = T), ## Edited to account for change from Ref to  Ref_tpd
                                               Ref_5x5_tpd = mean(Ref_5x5_tpd, na.rm = T),
                                               Ref_composite_tpd = mean(Ref_composite_tpd, na.rm = T),
                                               RefComposite_5x5_tpd = mean(RefComposite_5x5_tpd, na.rm = T),
                                               num_nas = sum(num_nas),
                                               radardist = mean(radardist_km, na.rm = T),
                                               RhoHV = mean(RhoHV, na.rm = T))
      
    train_final <- train_final %>% mutate(num_readings = num_readings)

# Look at rain gauge totals in the dataset < 150 mm. 
    ggplot(train_final %>% filter(Expected  < 150), aes(x = Expected)) + geom_histogram() + 
      labs(title = "Rain gauge total (Expected) < 150", x = "Expected (mm)")

# Number of outliers ??
    sum(train_final$Expected > 70)
    sum(train_final$Expected >  150)
    
    sum(train_final$Expected > 150)/nrow(train_final)
    sum(train_final$Expected > 70)/nrow(train_final)
    
    
# Remove all values above 150mm  
    
    train_final <- train_final %>% filter(Expected < 150)
    
# look at how many Na's still remain
    lapply(train_final, function(x){sum(is.na(x)) })  
    
# Create training and validation sets
    
    
    strat<- data.frame( fact  = cut(train_final$Expected, breaks = quantile(train_final$Expected) , 
        labels = c("q1","q2", "q3","q4"), include.lowest = TRUE), 
        idx =  1:length(train_final$Expected) )
    
    # doing a ~ 70:30 split -- 503156 in training set, 215642 in validation set. 
    # i.e. 125789 from each quantile
    
    q1Id <- strat %>% filter(fact=="q1") %>% select(idx)
    q2Id <- strat %>% filter(fact=="q2") %>% select(idx)
    q3Id <- strat %>% filter(fact=="q3") %>% select(idx)
    q4Id <- strat %>% filter(fact=="q4") %>% select(idx)
    
    train_ids <- c( q1Id[sample(nrow(q1Id), 125789),], 
                    q2Id[sample(nrow(q2Id), 125789),],
                    q3Id[sample(nrow(q3Id), 125789),],
                    q4Id[sample(nrow(q4Id), 125789),])
    valid_ids <- strat$idx[-train_ids]
    
    rm(q1Id, q2Id,q3Id,q4Id)
    
    train_df <- train_final[train_ids,]
    valid_df <- train_final[-train_ids,]
    

    
# Model training
    
    param0 <- list("objective"  = "reg:linear" 
                   , "eval_metric" = "rmse"
                   , "eta" = 0.3
                   , "min_child_weight" = 5    
                   , "max_depth" = 4
                   , "nthreads" = 2
    )
    
    xgtrain = xgb.DMatrix(as.matrix(train_df %>% select(-Expected)), label = train_df$Expected, missing = NA)
    xgvalid = xgb.DMatrix(as.matrix(valid_df %>% select(-Expected)), label = valid_df$Expected, missing = NA)
    rm(train_final,train_ids,valid_ids)
    gc()
    
    
    watchlist <- watchlist <- list(train=xgtrain, test=xgvalid)
    xgt_mod1  <- xgb.train(params = param0, data = xgtrain , nrounds =1000, verbose = 1, print.every.n = 20, 
                           watchlist = watchlist)
    
    pr  <- predict(xgt_mod1,xgvalid)
## pre-process test set. 
    
    test <- fread('raw_data/test.csv')
    str(test)
    test <- as.data.frame(test)
    # test_raw_tmp <- test[!is.na(test[,"Ref"]),]  ## Skip this in the test set ?
    
    test_raw_tmp <- test
    
    results <- test_raw_tmp %>% group_by(Id) %>% summarize(Expected=mpalmer(Ref, minutes_past))
    names(results) <- c("Id","MPlmr")
    str(results)
    test_raw_tmp <- merge(test_raw_tmp,results,by = "Id")
    tmp <- test_raw_tmp[order( test_raw_tmp$Id, test_raw_tmp$minutes_past),] 
  
    chk <- tmp %>% group_by(Id) %>% do(tdiff = time_difference(.$minutes_past))
    
    
    #unlist(lapply(chk$tdiff , function(x) {x < 0}))
    any(unlist(lapply(chk$tdiff , function(x) {x < 0})))
    
    
    # check if the these Id's match the tmp. 
    all(rep(chk$Id, unlist(lapply(chk$tdiff , function(x) {length(x)})))==tmp$Id)   # YES!
    
    # add the tdiff vector to tmp and call it valid_time
    tmp$valid_time <- unlist(chk$tdiff)
    
    # Now use the valid time to define new features
    
    num_readings <- unlist(lapply(chk$tdiff , function(x) {length(x)}))
    num_nas <-  apply(tmp, 1 ,function(x){sum(is.na(x))})  
    
    tmp <- tmp %>%  mutate(Ref_5x5_tpd = 10^(Ref_5x5_50th/10)*valid_time, 
                           Ref_composite_tpd = 10^(RefComposite/10)*valid_time,
                           RefComposite_5x5_tpd  = 10^(RefComposite/10)*valid_time)
    
    tmp <- tmp %>% mutate(num_nas = num_nas)

    
    #Collapse to one record per Id - Just taking mean although in most cases I am just loading the unique value
    
    test_final <- tmp  %>% group_by(Id) %>% summarize( MPlmr = mean(MPlmr, na.rm = T), 
                                                       Ref = mean(10^(Ref/10), na.rm = T),
                                                       Ref_5x5_tpd = mean(Ref_5x5_tpd, na.rm = T),
                                                       Ref_composite_tpd = mean(Ref_composite_tpd, na.rm = T),
                                                       RefComposite_5x5_tpd = mean(RefComposite_5x5_tpd, na.rm = T),
                                                       num_nas = sum(num_nas),
                                                       radardist = mean(radardist_km, na.rm = T),
                                                       RhoHV = mean(RhoHV, na.rm = T))
    
    test_final <- test_final %>% mutate(num_readings = num_readings)
    
  
    
    xgtest = xgb.DMatrix(as.matrix(test_final), missing = NA)
   
    
    pr  <- predict(xgt_mod1,xgtest)
    
    save(test_final, xgtest, pr ,file = "temp/test_results_xgboost.Rdata")
    
    ######## WRITE SOLUTION TO FILE #### -- from David lucas 
    
    sample_sol <-fread("./raw_data/sample_solution.csv")
    
    res <- data.frame(
      Id = test_final$Id,
      Expected =  pr 
    )
    
    #convert expected values to 0.01in values
    res$Expected <- round(res$Expected / 0.254) * 0.254
    
    summary(res)
    
    write.csv(res, "Submissions/xgb_sub1.csv", row.names = FALSE, col.names = TRUE)
    
    ####
    
    
    
    
    
    
    