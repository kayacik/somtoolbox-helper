function [results] = plot_pcas(map, folder)
% A simple script that plots the PCAs for a given SOM 
% and stores them as PDF under the given folder
% Usage: plot_pcas(map, 'plots/pcas/')
%
h = figure;
colormap('hot');
som_show(map, 'comp', 'all', 'edge', 'on', 'footnote', '', 'bar', 'none');
filename = strcat(folder, 'comp_all.pdf');
set(gcf, 'Color', 'w');
export_fig(gcf, filename);
close(gcf);
for i=1:size(map.comp_names,1)
    h = figure;
    colormap('hot');
    som_show(map, 'comp', i, 'edge', 'on', 'footnote', '', 'bar', 'none');
    filename = strcat(folder, 'comp', int2str(i), '_', strrep(map.comp_names{i}, '.', '_') ,'.pdf');
    set(gcf, 'Color', 'w');
    export_fig(gcf, filename);
    close(gcf);
end
