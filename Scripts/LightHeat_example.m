%Example usage of Light and Heat functions
%Generate 3 plots for 532 nm light:
%Figure 1 - Intensity relative to maximum intensity (log scale) from a 62
%micron diameter, .22 NA fiber
%Figure 2 - Steady state temperature change for the same fiber
%Figure 3 - Time course of temperature change for the same fiber during and
%after 60 seconds of illumination
%
%Written by Joseph M. Stujenske
%Stujenske et al., Cell Reports, 2014
%
%Anticipate this to take >30 minutes to compute.

[frac_abs,frac_trans,params,r,depth]=MonteCarloLight(1,.031,.22,532,100);
figure; LightHeatPlotter(r,depth,log10(frac_trans./max(frac_trans(:))),532);caxis([-4 0]);
[u_time,u_space,t,r,depth]=HeatDiffusionLight(frac_abs,params,.03,0,60,120,10,6,.25);
figure; LightHeatPlotter(r,depth,u_space,'hot');caxis([0 4.2])
figure; imagesc(t,depth,u_time); colormap('hot');caxis([0 2.2])
