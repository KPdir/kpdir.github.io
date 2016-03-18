---
title: "Particle Detector R&D"
layout: post
date: 2013-01-23
tag: jekyll
img:
projects: true
description: "A modified detector concept: benefits and performance"
jemoji: '<img class="emoji" title=":graduation cap:" alt=":graduation cap:" src="https://assets.github.com/images/icons/emoji/unicode/1f393.png" height="20" width="20" align="absmiddle">'
---

### Some background
###### Direct dark matter search

Direct dark matter search is very active research area in experimental particle physics with strong competition among experiments. It attempts to detect dark matter particles from our own galaxy using terrestrial detectors. This would serve to confirm its existence as well as allow us to better understand dark-matter if it does exist. SuperCDMS is a leading experiment in this area and is collaboration of several university groups and national labs. The experiment is currently housed in the Soudan mine in northern Minnesota, US and is set to move to SNOLAB in Sudbury, Canada and upgrade its effort. Such an experiment is a rare event search, meaning it looks for a signal among a lot of noise (usually referred to as background). To be more explicit, such experiments typically keep track of individual events, which are interactions of a particle inside the detector. They also measure certain physical parameters such as energy, position, timing etc. for each such event. These backgrounds typically include ambient radioactivity, cosmogenic particles, intrinsic material radioactivity and other local effects. Such experiments rely heavily on reducing the background through several strategies including shielding, ensuring radio-purity of materials, vetoing known background events etc.. They further improve their sensitivity through clever design of detectors to eliminate significant portions of background events. They also try ascertain the expected amount and distribution of residual background events that cannot be distinguished from the signal through data analysis and simulations. Finally through a rigorous scientific analysis they ascertain if any candidate dark-matter particles were observed, i.e. of which there was a statistically significant excess in the data and a distribution of events that not as expected for the background events.

###### SuperCDMS particle detectors

The SuperCDMS particle detectors used at Soudan are cryogenic semiconductor detectors made. They measure the energy deposited by the particles interacting in the detector through a measurement of phonons (lattice vibrations) and ionization (electric charges released). They are solid cylinders of either Germanium or Silicon with phonon and ionization sensors on the top and bottom surfaces as shown in figure.1 below. A detailed account can be found here [1]



|  <img src="{{ site.relrefurl }}/Site_Materials/figures/det_izp_photo.png" width="400" align="center"> |
|-----------------------------|
|Figure.1: A photo of superCDMS detector. Source: <a href="http://scitation.aip.org/content/aip/journal/apl/103/16/10.1063/1.4826093"> AIP journal article 2013</a> |



The technology of these sensors is very fascinating in itself and rather involved so I would refer the interested reader to article [2](). These two signals are then used in combination to distinguish candidate dark matter particles from a major source of background events called 'electron-recoils'. Electron-recoils are a class of events in which a large portion of the energy from interacting particle is absorbed by recoiling electrons in the detector material. In contrast, dark-matter particles and neutrons produce an interaction where the major portion of the energy deposited by the incoming particle is transferred to the nuclei in the detector material and are called 'nuclear-recoils'. This shows up as a difference in the ratio of the energy measured in the charge (ionization) channel vs the energy measured in the phonon (lattice vibration) channel. Figure.2 shows this difference.


|  <img src="{{ site.relrefurl }}/Site_Materials/figures/er_nr_schm.png" width="400" align="center"> |
|-----------------------------|
|Figure.2: Energy in charge (ionization) channel vs energy in phonon channel for Electron-Recoils and Nuclear-Recoils. |


This is typically illustrated in a transformed parameter space of Yeild vs recoil-energy, where recoil-energy is the true energy deposited by the incoming particle and Yield is the ratio of the ionization signal and the recoil-energy. With the use of data generated from known sources of particles for calibration we arrive at regions of Electron-Recoils and Nuclear-Recoils in this transformed parameter space. Figure.3 shows two distinct bands of events from calibration sources in this parameter space; the black dots correspond to electron-recoils and the grey dots correspond to nuclear-recoils.

|  <img src="{{ site.relrefurl }}/Site_Materials/figures/er_nr.png" width="400" align="center"> |
|-----------------------------|
|Figure.2: Yield vs recoil-energy for Electron-Recoils and Nuclear-Recoils. |




### A modified detector design

The objective here was to compare performance of alternative particle detector designs with the existing one used by SuperCDMS and come up with a design that produced comparable performance while reducing the cost of fabrication and data analysis. This was a project carried out at Queen's University under the supervision of Dr.Wolfgang Rau and formed a significant portion of my thesis project for MSc in Physics. This project was part of a larger detector R&D effort at the SuperCDMS collaboration aimed at a next generation experiment.

The project involved two phases. The first phase involved establishing proof of principle through analysis of existing data and analytic calculations. The second phase involved configuring a detector according to the proposed alternative design and validating the first phase through independent measurements (i.e. new data).

#### PHASE 1: Proof of principle
