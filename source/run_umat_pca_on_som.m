function [dummy] = run_umat_pca_on_som(map, folder)
% A simple script that plots the Umatrix and PCAs for a given SOM 
% and stores them as PDF under the given folder. Do not use paths
% starting with ~ as the supporting functions do not like them.
% Usage: plot_pcas(map, 'plots/')
%
folder = [folder '/'];
mkdir(folder)
plot_umat(map, folder);
plot_pcas(map, folder);
