function [results] = plot_umat(map, folder)
% A simple script that plots the Umatrix for a given SOM 
% and stores it as PDF under the given folder
% Usage: plot_umat(map, 'plots/umat/')
%
h = figure;
colormap('hot');
som_show(map, 'umat', 'all', 'edge', 'on', 'footnote', '');
filename = strcat(folder, 'umat.pdf');
set(gcf, 'Color', 'w');
export_fig(gcf, filename);
close(gcf);
