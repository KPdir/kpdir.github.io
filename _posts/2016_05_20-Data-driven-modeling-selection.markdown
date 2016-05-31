---
title: "Data-driven modeling and specification good operating regions of a low-mass dark matter particle detector"
layout: post
date: 2015-09-01
fromdate: 2016-08-01
tag:
- Data cleaning
- Statistical modeling
- Data analysis
- Simulations
projects: true
description: "Improving sensitivity of measurement in a dark matter detector by data driven specification of good detector region"
jemoji: '<img class="emoji" title=":graduation cap:" alt=":graduation cap:" src="https://assets.github.com/images/icons/emoji/unicode/1f52d.png" height="20" width="20" align="absmiddle">'
---

## Summary

SuperCDMS is an experiment to detect dark matter directly. It relies on accurate measurements of energy and position of particle interactions in its low temperature semiconductor detectors. In the recent past there has been a significant motivation to look for lower energy dark matter particle candidates [](). With this in view, SuperCDMS has been running a low-mass dark matter experiment based on a clever modification of the detectors that allows to operate them at higher electric field in and gain better sensitivity [](). A data quality selection for the good operating region (a fiducial volume) was
determined to remove regions with excessive noise. A data-driven modeling approach was used which helped to achieve very good results for the same.  

## Some background

SuperCDMS makes two rather sensitive measurements: ionization (charges) and phonons (lattice vibrations in crystals) produced during particle interactions. Signals from ionization and phonon sensors are recorded and then signal-processing algorithms extract energy and position information from these signals. Optimal filtering is the signal processing algorithm of choice here. It takes advantage of the fact that the signals from particle interactions have a particular shape in time which is determined from detector physics and sensor response. This particular shape of the signal in time implies a certain specified power spectral density (PSD). Given the various precautions taken to reduce the pickup of external electronic noise, the power-spectral-density of electronic noise in these signals also remains reasonably constant over time. This allows for creating templates for the signal shape in time by averaging the signal recorded for several such events. A similar averaging over time of noise traces produces a power-spectral-density for noise. The algorithm implements a combined frequency domain fit  of the signal recorded from events in the detector using the signal and noise templates. The fit parameters being the signal amplitude and a time shift. This allows for a better estimation of energy than just finding the amplitude of the pulse or a time-domain fit. Due to the physical processes that occur during an interaction event the initial part of the signal contains majority of the position information and the later part of the signal contains a majority of the energy information. Due to the variability in the initial part of the signal shape for events with the same energy but from different parts of the detector, fitting a single template to all events leads to poor fitting and hence bad estimation of both energy and position. To overcome this problem two different versions of the algorithm were implemented. One best at estimating energy by giving less importance to the initial part of the signal and another that is best at estimating position. This was a reasonable strategy and gave relatively good results. However, running two algorithms meant this was somewhat computationally intensive and it was possible that some of the information related to position as well as energy was being lost by decoupling these two measurements into two separate algorithms. A clever modification described below was made in an attempt to overcome these two limitations.

## An improved algorithm
