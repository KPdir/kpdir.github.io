# How much did it rain - competition-II

### Objective: predict the amount of rain based on weather radar measurements. 

*** 

#### Some Context:

- Rainfall is highly variable across space and time and hence tricky to measure

- Rain-gauges are highly effective but we cant have them everywhere; its not practical

- Weather radars can give us this rainfall information across large areas but predictions based on them 
do not always agree with the rain observed by the rain-guages. 

- Radar measurements give us instantaneous values of rainfall rate but rain gauges give us the cumulative sum of the rainfall over periods of time. 

- Polarimetric doppler radars are supposedly good at measureing dropsizes and hence giveing a better estimate of the amount rainfall. Weather radars are interesting, check out the [Wikipedia article](https://en.wikipedia.org/wiki/Weather_radar) for more on them if you are curious.


***
#### A glimpse of the raw data set 




 Id   minutes_past   radardist_km    Ref   Ref_5x5_10th   Ref_5x5_50th   Ref_5x5_90th   RefComposite   RefComposite_5x5_10th   RefComposite_5x5_50th   RefComposite_5x5_90th       RhoHV   RhoHV_5x5_10th   RhoHV_5x5_50th   RhoHV_5x5_90th      Zdr   Zdr_5x5_10th   Zdr_5x5_50th   Zdr_5x5_90th          Kdp   Kdp_5x5_10th   Kdp_5x5_50th   Kdp_5x5_90th    Expected
---  -------------  -------------  -----  -------------  -------------  -------------  -------------  ----------------------  ----------------------  ----------------------  ----------  ---------------  ---------------  ---------------  -------  -------------  -------------  -------------  -----------  -------------  -------------  -------------  ----------
  1              3             10     NA             NA             NA             NA             NA                      NA                      NA                      NA          NA               NA               NA               NA       NA             NA             NA             NA           NA             NA             NA             NA   0.2540001
  1             16             10     NA             NA             NA             NA             NA                      NA                      NA                      NA          NA               NA               NA               NA       NA             NA             NA             NA           NA             NA             NA             NA   0.2540001
  1             25             10     NA             NA             NA             NA             NA                      NA                      NA                      NA          NA               NA               NA               NA       NA             NA             NA             NA           NA             NA             NA             NA   0.2540001
  1             35             10     NA             NA             NA             NA             NA                      NA                      NA                      NA          NA               NA               NA               NA       NA             NA             NA             NA           NA             NA             NA             NA   0.2540001
  1             45             10     NA             NA             NA             NA             NA                      NA                      NA                      NA          NA               NA               NA               NA       NA             NA             NA             NA           NA             NA             NA             NA   0.2540001
  1             55             10     NA             NA             NA             NA             NA                      NA                      NA                      NA          NA               NA               NA               NA       NA             NA             NA             NA           NA             NA             NA             NA   0.2540001
  2              1              2    9.0            5.0            7.5           10.5           15.0                    10.5                    16.5                    23.5   0.9983333        0.9983333        0.9983333        0.9983333   0.3750        -0.1250         0.3125         0.8750    1.0599976     -1.4100037     -0.3500061      1.0599976   1.0160005
  2              6              2   26.5           22.5           25.5           31.5           26.5                    26.5                    28.5                    32.0   1.0016667        0.9816667        0.9983333        1.0050000   0.0625        -0.1875         0.2500         0.6875           NA             NA             NA      1.4099884   1.0160005
  2             11              2   21.5           15.5           20.5           25.0           26.5                    23.5                    25.0                    27.0   1.0016667        0.9950000        0.9983333        1.0016667   0.3125        -0.0625         0.3125         0.6250    0.3499908             NA     -0.3500061      1.7599945   1.0160005
  2             16              2   18.0           14.0           17.5           21.0           20.5                    18.0                    20.5                    23.0   0.9950000        0.9950000        0.9983333        1.0016667   0.2500         0.1250         0.3750         0.6875    0.3499908     -1.0599976      0.0000000      1.0599976   1.0160005
  2             21              2   24.5           16.5           21.0           24.5           24.5                    21.0                    24.0                    28.0   0.9983333        0.9950000        0.9983333        0.9983333   0.2500         0.0625         0.1875         0.5625   -0.3500061     -1.0599976     -0.3500061      1.7599945   1.0160005
  2             26              2   12.0           12.0           16.0           20.0           16.5                    17.0                    19.0                    21.0   0.9983333        0.9950000        0.9983333        0.9983333   0.5625         0.2500         0.4375         0.6875   -1.7600098     -1.7600098     -0.3500061      0.7099915   1.0160005
  2             31              2   22.5           19.0           22.0           25.0           26.0                    23.5                    25.5                    27.5   0.9983333        0.9950000        0.9983333        1.0016667   0.0000        -0.1875         0.2500         0.6250   -1.0599976     -2.1200104     -0.7100067      0.3499908   1.0160005
  2             37              2   14.0           14.0           18.5           21.0           19.5                    20.0                    21.0                    23.0   0.9983333        0.9916667        0.9983333        0.9983333   0.5000         0.1875         0.4375         0.8125    0.0000000     -1.7600098     -0.3500061      1.0599976   1.0160005
  2             42              2   12.0           11.0           12.5           17.0           19.5                    18.0                    21.0                    23.0   0.9983333        0.9950000        0.9983333        0.9983333   0.6250         0.3750         0.6250         0.8750   -0.3500061     -0.3500061      0.0000000      0.3499908   1.0160005

***

#### A more concrete problem statement:

Predict the amount of as rain measured by the rain gauges (in 'mm') over a period of one hour, given instantaneous radar measurements (and derived quantities) at different instances over that hour. 

#### Some notes about the data set

- The competetion admin notes that "Essentially radar measures instantaneous rain rate and the gauge measures hourly total. It is safe to assume that if the radar observations are nans, then the rainrate at that instant in time is zero. But an hour where 40% of the observations are nan could have had some rain." Clarifies in a later comment saying he means the "Ref" column. 

- There are extreme outliers in the target value coming from clogged/not working  rain-gauges. People tried different threshold values  "50 - 100 mm" and many settled close to 70 mm. Not sure if there were any specific theshold or rows that were suggested to be left out by the admin. 

- The number or radar sweeps for each Id is not the same. Hence we need to somehow collapse this information in to one record per Id. 

- The training data has been collected over 20 days each month during corn growing season in US. The test data is form the rest of the 10/11 days of those months. Location and time information has been censored. This means any two records can be correlated and CV or validation split will not be as effective.

*** 
#### Pre-processing (preparing dataset for model training)

- Remove rows where "Ref" is NA

- Remove records with "Expected" (rain gauge reading) > 150 mm. Chose to be more conservative for the first attempt. These are close ~1% of total rows. 

- Calculate rainfall rate estimate based on [Marshall-Palmer relation](http://glossary.ametsoc.org/wiki/Marshall-palmer_relation) (i.e. Z = 200*(R)^1.6, where Z is reflectivity and R is rainfall rate). This is also the benchmark.

- Calculate time differences between readings to use as the amount of each time radar measurement was valid. Used for other "Ref" features, particularly Ref_5x5_50th, RefComposite, RefComposite and RefComposite_5x5_50th. These features were simply mean(Ref_feature * time_differnce), where the Ref_feature was converted back from decibel to original units. 

- Other features were created:  mean(RhoHV), mean(radardist_km) in each record,  the number of NA's in original record and number of measurements in each record.  




- Remove all rows with Expected > 150 mm. Lets look at the rain gauge values ("Expected" column) in the training set which are < 150 mm. 

|  <img src="/Users/workhorse2/Documents/Meetup_Competetions/How_much_did_it_rain_II/figures/Expected_less150.png" width="300" align="center"> |
|-----------------------------|
|Figure. Most of the rain gauge readings are  < 50 mm.|


- The marshall palmer predictions (benchmark) are noisy at low rain gauge readings.

|  <img src="/Users/workhorse2/Documents/Meetup_Competetions/How_much_did_it_rain_II/figures/MPalmer_Expected.png" width="300" align="center"> |
|-----------------------------|
|Figure. Comparing the Marshall palmer predictions with observed rain gauge readings.|




 


- Create test and validation sets based on a 70/30 split. Implement a basic stratified sampling over the variable "number of records per Id". Pick equally from all teh quantiles of this variable to generate the training set - rest is the validation set. 



- Train xgboost model with following parameters. 

                   "objective"  = "reg:linear" 
                   , "eval_metric" = "rmse"
                   , "eta" = 0.01
                   , "min_child_weight" = 20    
                   , "max_depth" = 4
                   , "nthreads" = 2
                   , "nrounds" = 400







- Made a submission with that model but it seems to be doing worse than the benchmark. Since the Marshall palmer values are also included as a feature this is somewhat surprising. So I suspect there is a bug somewhere.   

***
#### Let's at the winning solution:

- The winner of this competetion used recurrent neural nets (RNN) and had some pretty interesting ideas. Here is [link to his blog post](http://simaaron.github.io/Estimating-rainfall-from-weather-radar-readings-using-recurrent-neural-networks/) about this competetion. 
    
***
##### What are RNNs? A brief description of the idea.  

- Traditional neural nets: 
    - Feed-forward nets. Use Backpropagation algorithm for training.  

|  <img src="/Users/workhorse2/Documents/Meetup_Competetions/How_much_did_it_rain_II/figures/wiki_neural_net.png" width="300" align="center"> |
|-----------------------------|
|Figure. Standard feed-forward neural net. Source: wikipedia|


- Recurrent neural nets: 
    - Have delayed outputs of hidden layer looping back on them, i.e. delayed by a time step or a training instance. 
    - Backpropagation can also be used to train RNN's but it just gets a litte more complicated. 
    
    
|  <img src="/Users/workhorse2/Documents/Meetup_Competetions/How_much_did_it_rain_II/figures/wikiRNN.png" width="300" align="center"> |
|-----------------------------|
|Figure. Recurrent neural net has delayed outputs from the hidden layer as additional inputs to the hidden layer.  Source: wikibooks.org|


|  <img src="/Users/workhorse2/Documents/Meetup_Competetions/How_much_did_it_rain_II/figures/RNN_unrolled_Colah.png" width="600" align="center"> |
|-----------------------------|
|Figure. An unrolled picture of a recurrent neural net makes the sequential behaviour clear. Source: [Cristopher Olah's blog](http://colah.github.io/posts/2015-08-Understanding-LSTMs/) |

***
A few remarks about his approach:

-  Recognized that each record (Id) has a sequence of measurements. The structure is similar to the toy adding problem: a key insight. 

- Did not implement an new features and tried to design a end-to-end learning framework. 

- Tried validation with stratified sampling but relied on the public leaderboard scores in the end since examples are correlated and he found that his models were severely overfitting. 

- Implemented drop-in data-augmentation. This he believes makes the network to account for the time-intervals between observations. (I don't have a good feeling for this).

- Stacked several hidden layers and sandwiched them between dense layers. Averaged the output of the dense layers in the final layer to get  the output. 

- Used mini-batch stochastic gradient descent (SGD) to train the model with batches of 64 sequences (records).

- The winning submission used a simple weighted average of 30 separate models. His best single model scored  23.6971 on public leaderboard. There seems to be not much about how these models difffered from each other. 

***

###### A few things to try next:

- Include other features like zDR and KDp etc. More accurate rainfall rate estimators are described [here](https://www.eol.ucar.edu/projects/dynamo/spol/parameters/rain_rate/rain_rates.html)

- Use MAE instead of RMSE for optimizing. 

- Ignore values with negative reflectivity values?

- Use a smaller threshold, maybe 70 mm. 

- Of course try implementing an RNN model. 


###### A few more useful links on RNN's:

- [Chistopher Olah's blog](http://colah.github.io/posts/2015-08-Understanding-LSTMs/)

- [WildML](http://www.wildml.com/2015/09/recurrent-neural-networks-tutorial-part-1-introduction-to-rnns/)

- [Stanford CS224 lecture notes on RNN's for NLP](http://cs224d.stanford.edu/lecture_notes/notes4.pdf)

- [Andrej Karpathy's blog](http://karpathy.github.io/2015/05/21/rnn-effectiveness/)


