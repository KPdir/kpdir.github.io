---
title: "Improving signal-to-noise in particle detectors."
layout: post
date: 2014-06-01
fromdate: 2013-10-01
tag:
- signal processing
- data analysis
- feature engineering
- statistics
- modeling
- research
projects: true
description: "A technique for improved physical parameter estimators"
jemoji: '<img class="emoji" title=":graduation cap:" alt=":graduation cap:" src="https://github.githubassets.com/images/icons/emoji/unicode/1f52c.png" height="20" width="20" align="absmiddle">'
---

## Summary

SuperCDMS is an experiment to detect dark matter directly. It relies on accurate measurements of energy and position of particle interactions in its low temperature semiconductor detectors. Signal processing algorithms are used to extract information that is then combined to estimate energy and position of events in these detectors. A clever modification to these algorithms was implemented which helped improve the accuracy of energy and position estimation.

## Some background

SuperCDMS makes two rather sensitive measurements: ionization (charges) and phonons (lattice vibrations in crystals) produced during particle interactions. Signals from ionization and phonon sensors are recorded and then signal-processing algorithms extract energy and position information from these signals. Optimal filtering is the signal processing algorithm of choice here. It takes advantage of the fact that the signals from particle interactions have a particular shape in time which is determined from detector physics and sensor response. This particular shape of the signal in time implies a certain specified power spectral density (PSD). Given the various precautions taken to reduce the pickup of external electronic noise, the power-spectral-density of electronic noise in these signals also remains reasonably constant over time. This allows for creating templates for the signal shape in time by averaging the signal recorded for several such events. A similar averaging over time of noise traces produces a power-spectral-density for noise. The algorithm implements a combined frequency domain fit  of the signal recorded from events in the detector using the signal and noise templates. The fit parameters being the signal amplitude and a time shift. This allows for a better estimation of energy than just finding the amplitude of the pulse or a time-domain fit. Due to the physical processes that occur during an interaction event the initial part of the signal contains majority of the position information and the later part of the signal contains a majority of the energy information. Due to the variability in the initial part of the signal shape for events with the same energy but from different parts of the detector, fitting a single template to all events leads to poor fitting and hence bad estimation of both energy and position. To overcome this problem two different versions of the algorithm were implemented. One best at estimating energy by giving less importance to the initial part of the signal and another that is best at estimating position. This was a reasonable strategy and gave relatively good results. However, running two algorithms meant this was somewhat computationally intensive and it was possible that some of the information related to position as well as energy was being lost by decoupling these two measurements into two separate algorithms. A clever modification described below was made in an attempt to overcome these two limitations.

## An improved algorithm

Drawing inspiration in part from the existing algorithms but also from a physical perspective we implemented an algorithm that used two templates for the signal instead of just one. While one of them captured the position information very well, the other captured the energy information very well. Since the templates  are created from data (i.e. signal pulses) we had to be careful about the selection of the sample so as to not be biased. In order for these templates to make sense it required some agile experimentation and feature engineering trying to combine information from different sensors on the detector. The algorithm then does a combined fit with these two templates to a signal-pulse.

Figure.1 below is an example of such a fit. It can be noticed how the two templates get weighted and added together to produce a fit that closely follows the pulse. The longer and slower template which corresponds to the energy component always remains positive while the sign of the template corresponding to the direction is dependent on where the event occurs in the detector.

|  <img src="{{ site.relrefurl }}/Site_Materials/figures/2Tfit_pulse_eg.png" width="500" align="center"> |
|-----------------------------|
|Figure.1: Example of a pulse fit from the modified algorithm. The black trace in the each plot corresponds to a sensor on the detector. The pulse shape of the signal on each sensor depends on the position of the event relative to that  sensor. The method of using two templates to works very well to account for the pulse shape. Source: SuperCDMS internal notes.|

This resulted in an improved energy resolution as can be noticed in the narrowing of the peak of Barium gamma line events at 356 keV as shown in figure.2. It also lead to an improvement in the position estimation, but the discussion of that being somewhat more involved is skipped here.

|  <img src="{{ site.relrefurl }}/Site_Materials/figures/Barium_Peak_res.png" width="500" align="center"> |
|-----------------------------|
|Figure.2: The narrowing of the peak for the modified algorithm (2T in black) vs the existing algorithm (NF in green) shows the improvement in the energy resolution gained from the modification. Source: SuperCDMS internal notes.|

This project was carried out at Queen's University along with members of the SuperCDMS research group with me leading the effort.  
