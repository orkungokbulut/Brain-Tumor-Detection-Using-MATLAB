clc; clear all; close all; 

I=imread('Y1.jpg');
figure, imshow(I); title('Original Image');

%Converting to gray scale
I = rgb2gray(I);
figure, imshow(I); title('Gray Scale Image');

%Sharpening
I = imsharpen(I);
figure, imshow(I); title('Sharpened Image');

%Adding salt-pepper noise and removing it with median filter
I = imnoise(I, 'salt & pepper', 0.03)
figure, imshow(I); title('Salt-Pepper Noise added image');
Imedian = medfilt2(I, [3, 3])
figure, imshow(Imedian); title('Noise Removed Image');

%Canny Alorithm
Icanny = edge(Imedian, 'canny', 0.4)
figure, imshow(Icanny); title('Canny Applied Image');

%Combining Canny and Original Image
I = imadd(uint8(Icanny), Imedian)
figure, imshow(I); title('Combined Image');

%Image Thresholding
I= im2bw(I,.6);%binarising with threshold .6
figure, imshow(I); title('Thresholded Image');

%Adding morphological processes
se = strel('disk', 20);
Io = imopen(I, se);
Ie = imerode(I, se);
Iobr = imreconstruct(Ie, I);
Iobrd = imdilate(Iobr, se);
Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
I2 = I;
fgm = imregionalmax(Iobrcbr);
I2(fgm) = 255;
se2 = strel(ones(5,5));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);
fgm4 = bwareaopen(fgm3, 20);
I3 = I;
bw = im2bw(Iobrcbr);
imshow(bw), title('After Morphological Processes')
figure
imshow(bw), title('Tumor Detected Image')

%Drawing Bounding Box and detecting the center of the tumor
[L, num] = bwlabel(bw);
bboxes = regionprops(bw, 'BoundingBox');

s  = regionprops(bw, 'all');
centroids = cat(2, s.Centroid);

hold on
%Tumor centroid
plot(centroids(:,1)+5, centroids(:,2), 'r*')
    %Drawing bounding box
    for k = 1 : length(s)
        CurrBB = s(k).BoundingBox;
        rectangle('Position', [CurrBB(1), CurrBB(2), CurrBB(3),CurrBB(4)], 'EdgeColor', 'g', 'LineWidth', 2)
    
        text(CurrBB(1)-10, CurrBB(2)-10, 'Tumor', 'FontSize', 10, 'Color', 'g')
        str = sprintf('Center: \n(%0.2f,%0.2f)\n Area: \n (%0.2f)',centroids(:,1), centroids(:,2),(CurrBB(3)*CurrBB(4)))
        annotation('textbox',[0.5,0.4,0.1,0.1],'String',str, 'Color', 'green' )
    end
hold off










