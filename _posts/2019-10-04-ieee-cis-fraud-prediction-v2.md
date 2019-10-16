---
title: "VESTA IEEE-CIS eCommerce Fraud Detection"
layout: post
date: 2019-10-04
fromdate: 2019-09-04
tag:
- Kaggle Competetion
- Machine Learning
- Data Cleaning
- Data Analysis
- Python
img:
projects: False
drafts: true
description: "Predict fraudulant transactions in eCommerce transactional data"
jemoji: '<img class="emoji" title=":graduation cap:" alt=":graduation cap:" src="https://github.githubassets.com/images/icons/emoji/unicode/1f697.png" height="20" width="20" align="absmiddle">'
---

## The Problem

Given anonymized eCommerce transaction data (tabular data) which were labelled "**Fraud**" or "**Not Fraud**", the task was to build a binary classifier model that will predict whether a given transaction is "Fraud" or "Not Fraud" in new data. The dataset for this Kaggle competetion was provided by Vesta Corporation. Vesta Corporation is a forerunner in guaranteed eCommerce payment solutions. Here's an exceprt from the competetion description:
<br>
> <div style="max-height:50px;text-align:center"><img src="{{ site.relrefurl }}/Site_Materials/figures/ieee-cis-logo.png" style="height:50px;display: inline; margin-right:20px"><img src="{{ site.relrefurl }}/Site_Materials/figures/Vesta-logo_200x.png" style="height:50px; display:inline; margin-left:20px" ></div>
>In this competition, you’ll benchmark machine learning models on a challenging large-scale dataset. The data comes from Vesta's real-world e-commerce transactions and contains a wide range of features from device type to product features. You also have the opportunity to create new features to improve your results.
>If successful, you’ll improve the efficacy of fraudulent transaction alerts for millions of people around the world, helping hundreds of thousands of businesses reduce their fraud loss and increase their revenue.


## Solution
The approach that put me in the top 50% of the competitors involved building a Tree based models with careful preprocessing and feature engineering. 

The given dataset had 400+ features and ~1.2 million transactions, about half of which was labelled training data. Preprocessing involved missing data imputation in numeric features, label-encoding of categorical features and removal of highly null columns. Given the nature of "Fraud" labelling logic, it made sense to indentify unique customers/card holders in the data. However as no personally identifiable data existed, proxies for unique-indentification were created using groups of loose identifiers. New features created included proxy-ID based aggregations, target likleihood encoding of interaction features and time based features.

A RandomForest based Tree model was fit along with class weighting to handle class-imbalance in the data (~96% of "Not Fraud"). The model was tuned to optimize for bias vs variance. A couple different Cross Validation (CV) strategies were used, which tried to replicate the train/test split closely. 

<div style="text-align:center">
<img src="{{ site.relrefurl }}/Site_Materials/figures/ieee-pipeline-schematic.png" style="height:400px">
<span>Data Procecssing and Modeling Pipleine</span>
</div>

## Project Website 
For details and for code please see the <a href="">project website</a> on Github.


