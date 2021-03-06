function [ image ] = get_roi( filename )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    image = imread (filename);
    image = rgb2gray (image);
    image = adapthisteq (image);
    
    projection = sum (image, 2); % Get the vertical projection.
    total = length (projection);
    halfway = round (total / 2);
   
    [value peak1] = max ( projection(1:halfway) );
    %projection (peak1) = 0;
    projection (1:halfway) = 0;
    [value peak2] = max ( projection );
    
    centre = round( (peak1 + peak2)/2 );
    
    image = image ( centre-40:centre+40 , :);

end

