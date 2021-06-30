function [pos2] = find_matches(I1,pos1,I2)
%% Convert I2 into grayscale
I2g = rgb2gray(I2);
%% Extract the interest points
I1p = detectHarrisFeatures(I1);
I2p = detectHarrisFeatures(I2g);
%% Compute descriptors of two images
[F1, Fp1] = extractFeatures(I1, I1p);
[F2, Fp2] = extractFeatures(I2g, I2p);
%% Match features and output matched points
IPairs = matchFeatures(F1, F2);
Mp1 = Fp1(IPairs(:,1));
Mp2 = Fp2(IPairs(:,2));
%% Calculate the transformation matrix and transform pos1
tform = estimateGeometricTransform2D(Mp1,Mp2,'similarity');
pos2 = transformPointsForward(tform,pos1);
end
%% The code in the Command window 
% I1 = im2double(imread('img1.png'));  
% I1 = rgb2gray(I1); 
% I2 = im2double(imread('img2.png'));   
% detector = detectHarrisFeatures(I1);
% pos1 = detector.Location;
% pos2 = find_matches(I1,pos1,I2);





