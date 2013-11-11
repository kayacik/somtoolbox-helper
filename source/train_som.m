function [map, data] = train_som(trainingfile, msize, trainlen)
% A simple script for automating SOM training
% Usage: [map, data] = train_som(trainingfile, msize, trainlen)
%        [map, data] = train_som('training.data', [10, 10], 2000)
data = som_normalize( som_read_data(trainingfile), 'range' )
map = som_randinit(data, 'msize', msize);
map = som_seqtrain(map, data, 'trainlen', trainlen)
