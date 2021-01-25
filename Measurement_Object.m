clc 
clear all
obj = imread('ball.jpg')
imshow(obj)

red = obj(:,:,1);
green = obj(:,:,2);
blue = obj(:,:,3);

figure(1)
subplot(2,2,1); imshow(obj); title('Original Image');
subplot(2,2,2); imshow(red); title('Red Plane');
subplot(2,2,3); imshow(green); title('Green Plane');
subplot(2,2,4); imshow(blue); title('Blue Plane');

figure(2)
level = 0.37;
bw2 = im2bw(blue,level);
subplot(2,2,1);imshow(bw2);title('Blue plane threholded');

fill = imfill(bw2,'holes');
subplot(2,2,2); imshow(fill); title('Holes filled');

clear = imclearborder(fill);
subplot(2,2,3); imshow(clear); title('Remove blobs on border');

se = strel('disk',7)
open = imopen(fill,se)

subplot(2,2,4); imshow(open); title('Remove small blobs');

diameter = regionprops(open,'MajorAxisLength')
figure(3)
imshow(obj)
d = imdistline


