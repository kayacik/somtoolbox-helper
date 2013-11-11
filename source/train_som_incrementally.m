function [map, data] = train_som(trainingfile, msize, trainlen, map0)
% A simple script for automating SOM training, incrementally from the last map state map0
% Usage: [map, data] = train_som(trainingfile, msize, trainlen, map0)
%        [map, data] = train_som('training.data', [10, 10], 2000, map0)
data = som_normalize( som_read_data(trainingfile), 'range' )
map = som_seqtrain(map0, data, 'trainlen', trainlen)
