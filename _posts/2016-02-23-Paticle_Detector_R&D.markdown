---
title: "A modified particle detector concept with efficiency and performance benefits"
layout: post
date: 2013-01-23
fromdate: 2010-01-01
tag:
-particle-physics
-data-analysis
-research
img:
projects: true
description: "A modified detector concept: benefits and performance"
jemoji: '<img class="emoji" title=":graduation cap:" alt=":graduation cap:" src="https://assets.github.com/images/icons/emoji/unicode/1f393.png" height="20" width="20" align="absmiddle">'
---


### Abstract

It is estimated that ~85% by mass of our universe is made up of dark-matter, a kind of matter that is fundamentally different from the kind that we and the stars and the planets are made of. WIMPs (Weakly Interacting Massive Particles) are a class of candidate particles that are highly favored the standpoint of both cosmology and particle physics. They interact weakly with one another and do not shine, they have interaction probabilities are in the range necessary to have been produced during the big-bang and to have remained as relics ever since.




### Some background



#### Dark matter and direct dark matter search

Dark matter is an explanation to the gravitational and structural observations made about the universe. Mass excesses in galaxies and galaxy-clusters inferred through rotation speeds of objects around their centers and from lensing effect of luminescent objets passing with large clusters of galaxies are a couple of prominent examples of such observations. It is called "dark" matter because it does not shine or glow and hence we cannot observe it through telescopes. This has serious implication for what dark matter could be. It means that dark matter does not interact electromagnetically and is fundamentally a different the kind of matter that makes up stars and us and all the other things that do shine. WIMPs (Weakly Interacting Massive Particles) are a class of candidate particles that are highly favored the standpoint of both cosmology and particle physics. They interact weakly with one another and do not shine, they have interaction probabilities are in the range necessary to have been produced during the big-bang and to have remained as relics ever since.

Direct dark matter search is very active research area in experimental particle physics with strong competition among experiments. It attempts to detect dark matter particles from our own galaxy using terrestrial detectors. This would serve to confirm its existence as well as allow us to better understand dark-matter if it does exist. SuperCDMS is a leading experiment in this area and is collaboration of several university groups and national labs. The experiment is currently housed in the Soudan mine in northern Minnesota, US and is set to move to SNOLAB in Sudbury, Canada and upgrade its effort. Such an experiment is a rare event search, meaning it looks for a signal among a lot of noise (usually referred to as background). To be more explicit, such experiments typically keep track of individual events, which are interactions of a particle inside the detector. They also measure certain physical parameters such as energy, position, timing etc. for each such event. These backgrounds typically include ambient radioactivity, cosmogenic particles, intrinsic material radioactivity and other local effects. Such experiments rely heavily on reducing the background through several strategies including shielding, ensuring radio-purity of materials, vetoing known background events etc.. They further improve their sensitivity through clever design of detectors to eliminate significant portions of background events. They also try ascertain the expected amount and distribution of residual background events that cannot be distinguished from the signal through data analysis and simulations. Finally through a rigorous scientific analysis they ascertain if any candidate dark-matter particles were observed, i.e. of which there was a statistically significant excess in the data and a distribution of events that not as expected for the background events.

#### SuperCDMS particle detectors

The SuperCDMS particle detectors used at Soudan are cryogenic semiconductor detectors made. They measure the energy deposited by the particles interacting in the detector through a measurement of phonons (lattice vibrations) and ionization (electric charges released). They are solid cylinders of either Germanium or Silicon with phonon and ionization sensors on the top and bottom surfaces as shown in figure.1 below. A detailed account can be found here [1]



|  <img src="{{ site.relrefurl }}/Site_Materials/figures/det_izp_photo.png" width="400" align="center"> |
|-----------------------------|
|Figure.1: A photo of superCDMS detector. Source: AIP Appl. Phys. Lett. article 2013, <http://dx.doi.org/10.1063/1.4826093> |



The technology of these sensors is very fascinating in itself and rather involved so I would refer the interested reader to article [2](). These two signals are then used in combination to distinguish candidate dark matter particles from a major source of background events called 'electron-recoils'. Electron-recoils are a class of events in which a large portion of the energy from interacting particle is absorbed by recoiling electrons in the detector material. In contrast, dark-matter particles and neutrons produce an interaction where the major portion of the energy deposited by the incoming particle is transferred to the nuclei in the detector material and are called 'nuclear-recoils'. This shows up as a difference in the ratio of the energy measured in the charge (ionization) channel vs the energy measured in the phonon (lattice vibration) channel. Figure.2 shows this difference.


|  <img src="{{ site.relrefurl }}/Site_Materials/figures/er_nr_schm.png" width="400" align="center"> |
|-----------------------------|
|Figure.2: Energy in charge (ionization) channel vs energy in phonon channel for Electron-Recoils and Nuclear-Recoils. |


This is typically illustrated in a transformed parameter space of Yeild vs recoil-energy, where recoil-energy is the true energy deposited by the incoming particle and Yield is the ratio of the ionization signal and the recoil-energy. With the use of data generated from known sources of particles for calibration we arrive at regions of Electron-Recoils and Nuclear-Recoils in this transformed parameter space. Figure.3 shows two distinct bands of events from calibration sources in this parameter space; the black dots correspond to electron-recoils and the grey dots correspond to nuclear-recoils. Despite this inherent difference in the two classes of events a portion of electron-recoil events "leak" in to signal region due to limitations detection technology. It has been ascertained that the vast majority this leakage comes from events happening close to the surface of the detector. The number of background events that leak into signal region for a defined number of "potential" background events is then a good parameter in assessing detector performance and can be termed as the "leakage rate". The "potential" background events being electron-recoil events that happen close to the surfaces of the detector.


|  <img src="{{ site.relrefurl }}/Site_Materials/figures/er_nr.png" width="400" align="center"> |
|-----------------------------|
|Figure.3: Yield vs recoil-energy for Electron-Recoils (black) and Nuclear-Recoils (grey). Source: APS Phys. Rev. D article 2005, <http://dx.doi.org/10.1103/PhysRevD.72.052009>. © American Physical Society, used with permission.|



### A modified detector design concept

Scaling an experiment of this kind can involve several challenges, one of them being the challenge of producing reliable detectors with good efficiency of cost and effort. The question of whether it is possible to produce a detector which could offer these benefits without affecting performance led us to a modified detector design. The modified design featured phonon sensors on a single side instead of two sides as in the case of existing detector. This would reduce fabrication costs and effort and reduce the probability of defects per detector. If using half the number of sensors did not compromise the performance very much, this would make for a lucrative trade-off. The alternative design also offered the chance to re-configure the ionization sensors in way so as to discriminate against a special class of background events called multiple-surface-scatter events. The details of that are beyond the scope of this short article, so I would refer the interested reader to section 5.1 in my [thesis]().   


The objective then was to compare performance of this alternative design to the one in use. This was a project carried out at Queen's University along with members of the SuperCDMS research group at Queen's and formed a major portion of my thesis project for MSc in Physics. This project was part of a larger detector R&D effort at the SuperCDMS collaboration targeted towards a larger version of the experiment in future.

This involved two phases. The first phase involved establishing proof of principle through analysis of existing data and analytic calculations. The second phase involved configuring a detector in the alternative design and validating the results of the first phase through independent measurements (i.e. new data).

#### PHASE 1: Proof of principle

The feasibility of the design could be tested by comparing the performance of the alternative design to the performance of the modified design. The key performance metric being the "leakage rate". This was accomplished by calculation of the leakage rate using data from sensors on single side of a detector with sensors on both sides. This meant that we could check the feasibility of the new design without having to produce a detector with the modified design.

Using only half the information available mean't that we had to come up with new estimators for quantities that were hitherto calculated using full information. This also meant that all the data cleaning and preparation had also to be re-done using only half the information. Figure.4 shows the yield vs recoil energy for the existing design with phonon sensors on both sides.







#### PHASE 2: Validation
