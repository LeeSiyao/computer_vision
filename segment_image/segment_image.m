%in this segment_image function, I used median filter to smooth the image 
%then I set the threshold which helped me to use canny to detect the edge of image
%finally I used gaussian mask to smooth the output
% write the following code in the command line to segment your image
%I=im2double(imread('image'));image is the image you want to seg(i.e. im1.jpg)
%seg=segment_image(I);
%imshow(seg)


function[seg]=segment_image(I)

Ia=rgb2gray(I);%transform the image to grayscale
Ia=medfilt2(Ia,[2,3]);%Use a median filter to filter out the noise.
thresh=[0.009,0.500];%set the low and high threshold 
edge_canny=edge(Ia,'canny',thresh,1.5);%use canny to detect the edge

mask=fspecial('gaussian',2,0.14);
seg=imfilter(edge_canny,mask);%use gaussian mask to smooth the edge
end
