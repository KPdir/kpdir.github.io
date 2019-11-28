---
title: "Predicting trip type of Walmart store visits."
layout: post
date: 2019-06-30
fromdate: 2019-06-01
tag:
- Kaggle Competetion
- Machine Learning
- Data Cleaning
- Data Analysis
- Python
- Retail
img:
projects: true
drafts: true
description: "Predict trip type of customer visits to Walmart stores"
jemoji: '<img class="emoji" title=":graduation cap:" alt=":graduation cap:" src="https://github.githubassets.com/images/icons/emoji/unicode/1f6d2.png?v8" height="20" width="20" align="absmiddle">'
---

<div style="text-align:center">
<img src="{{ site.relrefurl }}/Site_Materials/figures/kaggle-logo-transparent-300.png" style="height:80px">
</div>

## <a name="the-problem"></a>The Problem

The challenge here was to classify customer trips to Walmart stores into 38 distinct trip types using only a transactional dataset of the items they've purchased. The objective behind this was to improve customers' shopping experiences by segmenting their store visits into different trip types. The input features consisted of  weekday of purchase, counts of items purchased, item codes, department description and finer product category. 

<div style="text-align:center"><img src="{{ site.relrefurl }}/Site_Materials/figures/jomjakkapat-parrueng-qaUMOLJwb48-unsplash.jpg" style="height:350px">
<p>Credit: Photo by Jomjakkapat Parrueng on Unsplash</p></div>

## <a name="solution"></a>Solution

I came across this competetion after it had already ended but found it very interesting and decided to work on it. 

The appraoch that placed my model in the top 35% submitted models comprised of combining the power of multiple weaker classifiers optimally along with feature engineering to boost the predictive power of my model. Data was pre-processed and new features were created based on the model to be applied. For each visit, counts of items by department and by finer category, time based features and features based on missing data and product returns were created. Frequency encoding of high cardinality categorical variables like UPC numbers and finer category numbers were also created. 

Bootstrapping was applied to Logistic Regression and KMeans classifiers to make them more robust. Finally 2-stage 5-fold Stacked Generalization was applied to combine the predictive power of the various models optimally.

<div style="text-align:center">
<img src="{{ site.relrefurl }}/Site_Materials/figures/walmart-triptype-pipeline-schematic.png" style="">
<p> Figure: Data procecssing and modeling pipleine involving 2-stage stacking of different models with appropriately processed feature sets.</p>
</div>

## <a name="project-website"></a>Project Website (coming soon)
For details and for code please see the <a href="">project website</a> on Github.

## Acknowledgement and Disclaimer
Kaggle has kindly permitted to use their logo for this website. However myself and this website are not officially connected to Kaggle. 
