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
<!---
## Contents
1. [The Problem](#the-problem)
2. [Solution](#solution)
3. [Project Website](#project-website)
-->

<div style="text-align:center">
<img src="{{ site.relrefurl }}/Site_Materials/figures/kaggle-logo-transparent-300.png" style="height:80px">
</div>

## <a name="the-problem"></a>The Problem

Given anonymized eCommerce transaction data which were labelled "**Fraud**" or "**Not Fraud**", the task was to build a binary classifier model that will predict whether a given transaction is "Fraud" or "Not Fraud" in new data. This challenging large-scale dataset had a wide range of features (400+) and ~1.2 million transactions, about half of which was labelled training data. 

<div style="max-height:50px;text-align:center"><img src="{{ site.relrefurl }}/Site_Materials/figures/web-hosting-em37kS8WJJQ-unsplash.jpg" style="height:200px;display: inline; margin-right:20px"><img src="{{ site.relrefurl }}/Site_Materials/figures/rupixen-Q59HmzK38eQ-unsplash.jpg" style="height:200px; display:inline; margin-left:20px" ></div><br>

The dataset for this Kaggle competetion was provided by Vesta Corporation and prepared in collaboration with IEEE-CIS. Vesta Corporation is a forerunner in guaranteed eCommerce payment solutions. The objective here is to improve the efficacy of fraudulent transaction alerts for millions of people around the world and reduce the loss due to fraud.

<!--
Photo by rupixen on Unsplash
Photo by Web Hosting on Unsplash
-->

## <a name="solution"></a>Solution
The approach that put me in the top 50% of the competitors involved building a Tree based models with careful preprocessing and feature engineering. 

Preprocessing involved missing data imputation in numeric features, label-encoding of categorical features and removal of highly null columns. Given the nature of "Fraud" labelling logic, it made sense to indentify unique customers/card holders in the data. However as no personally identifiable data existed, proxies for unique-indentification were created using groups of loose identifiers. New features created included proxy-ID based aggregations, target likleihood encoding of interaction features and time based features.

A RandomForest based Tree model was fit along with class weighting to handle class-imbalance in the data (~96% of "Not Fraud"). The model was tuned to optimize for bias vs variance. A couple different Cross Validation (CV) strategies were used, which tried to replicate the train/test split closely. 

<div style="text-align:center">
<img src="{{ site.relrefurl }}/Site_Materials/figures/ieee-pipeline-schematic.png" style="height:400px">
<p> Figure: Data Procecssing and Modeling Pipleine</p>
</div>

## <a name="project-website"></a>Project Website 
For details and for code please see the <a href="">project website</a> on Github.


