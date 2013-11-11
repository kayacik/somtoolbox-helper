function [map, data] = run_umat_pca_on_data(trainingfile, folder)
% A simple script that plots the Umatrix and PCAs for a given data
% after training and SOM. Created figures are stored as PDFs. 
% Do not use paths starting with ~ as the supporting functions do not
% like them.
% Usage: plot_pcas(map, 'plots/')
%
[map, data] = train_som(trainingfile, [15,15], 100)
folder = [folder '/'];
plot_umat(map, folder);
plot_pcas(map, folder);