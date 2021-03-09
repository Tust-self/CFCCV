clc;clear all;close all;
II=imread('a.jpg');
tic
I=rgb2gray(II);
% % I=im2double(I);
[row,col]=size(I);
Img=I;
initialLSF = zeros(row,col);


initialLSF(140:156,110:158) = 1;%a 180

initialLSF(114:135,103:133) = 1;%b 60

initialLSF(123:144,60:88) = 1;%c 100
initialLSF(145:167,134:147) = 1;%d   120
% initialLSF(112:143,85:125) = 1;%e 160

% initialLSF(128:143,112:131) = 1;%f 180

Findices = find(initialLSF==1);
FColors = double(I(Findices));
%%FColors =im2double(I(Findices));
NumFClusters =10;
% opts=statset('Display','final');
[FCClusters,FId,obj_fcn] = fcm(FColors, NumFClusters);
A=sort(FCClusters);

Img(find(Img<(A(1)+A(2))/2))=A(1);
Img(find(Img>=(A(NumFClusters-1)+A(NumFClusters))/2))=A(NumFClusters);
for i=2:NumFClusters-1
    a=(A(i-1)+A(i))/2;
     b=(A(i+1)+A(i))/2;
     Img(find(I<b&I>=a))=A(i);
end
Img=I-4/5*Img;
figure(1)
imshow(Img)



epsilon=1;

seg = region_seg(II,I,Img,initialLSF,120); %-- Run segmentation
t=toc
figure,imshow(seg);title('result');

% figure(2)
 imwrite(seg,'a.png');



