function [ cluster, histogram ] = get_cluster( number_of_clusters, index, veins, training_indices, fractions, col_to_sort, remove1entry )
%get_cluster Returns the cluster centroids for set of data
% Uses k-means to calculate centroids of the clusters. 
% kmeans runs for 200 iterations
%
% Cluster centroids are assigned for determinism. Done by sorting
% co-ordinates according to y-values

% number_of_clusters is self explanatory
% "index" is refers to the index of the veins database. Ie, specify index
% =1 to create the cluster of images from 1 to 6 (assuming there are 6
% samples per person
% veins is the veins database
% col_to_sort is used for determining initial centroid locations
% remove1entry is a parameter that I experimented with and made results
% worse. By default its disabled

if (nargin < 4)
   training_indices = [0, 2, 3, 5]; 
end

if (nargin < 6)
   col_to_sort = 2; 
end

if (nargin < 5)
    fractions = 0;
end

if (nargin < 7)
    remove1entry = 0;
end

cluster = [];

%training = [index, index+2, index+3, index+5];
training = index + training_indices;
training_data = [];

for i = training
    training_data = [training_data ; [veins(i).x veins(i).y] ];
end

%number_of_clusters = min(number_of_clusters, length(training_data));
if (fractions)
    number_of_clusters = floor (number_of_clusters * length(training_data)); % In this case, the input parameter is bit of a misnomer as it should really be "fraction"
else
    number_of_clusters = min(number_of_clusters, length(training_data));
end
%% This is my method of initially setting the starting points. Sort the (x, y) pairs according to the y co-ordinate, and then pick samples at uniformly spaced intervals
training_data = sortrows (training_data,col_to_sort);
starting_point = training_data(1,:);

for i = 2:number_of_clusters
    idx = round(length(training_data)/number_of_clusters * i);
    starting_point = [starting_point ; training_data(idx,:) ];
end
%%


[vals, cluster] = kmeans_open(training_data, number_of_clusters, 'start', starting_point, 'emptyaction', 'drop', 'Maxiter', 200);

histogram = hist(vals, number_of_clusters);

if (remove1entry)
    %histogram = hist(vals, number_of_clusters);
    idx = find( histogram == 0 | histogram == 1);
    cluster(idx, :) = NaN;
end

end

