function [ score ] = get_score( vein1, vein2 )
%UNTITLED6 Summary of this function goes here
%   The vein1 and vein2 is a bit of a misnomer, because the "distEmd" and
%   "distChiSquare" expect histograms
    
%    score = bitwise_hamming(vein1(:), vein2(:));
    
    %for row = 1:size(vein1, 1)
    %    for col=1:size(vein1, 2)
    %        score = score + disthamming(vein1(row,col), vein2(row,col));
    %    end
    %end

%    score = double(score) / (size(vein1, 1) * size(vein1, 2));

    score = distChiSquareFast(vein1, vein2);
%     score = distEmd(vein1, vein2);
end

