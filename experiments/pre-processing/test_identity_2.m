function [ id, distance, distances ] = test_identity_2( chosen_vein, hd_fraction, veins )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
distances = zeros (length(veins), 1);

%for j = 1:length (veins_c)
%    [score, matches] = compare_distances (veins_c(chosen).distances, veins_c(j).distances, veins_c(chosen).angles, veins_c(j).angles, 1, 0.05);
%    [matches, score]
%end

for j = 1:length (veins)
    
    distances(j) = mhd_fast ( [chosen_vein.x chosen_vein.y], [veins(j).x veins(j).y], hd_fraction);

end

[distance id] = min (distances);

%t = distances;
%t (t == 0) = Inf;
%[distance id] = min(t);

end

