clc
clear all
I=imread('xian.bmp');
figure
imshow(I);
title('ԭʼͼ��');
I1=rgb2gray(I);                %����ɫͼ��ת���Ҷ�ͼ��
threshold=graythresh(I1);        %���㽫�Ҷ�ͼ��ת��Ϊ��ֵͼ�����������
BW=im2bw(I1, threshold);       %���Ҷ�ͼ��ת��Ϊ��ֵͼ��
figure
imshow(BW);
title('��ֵͼ��');
dim=size(BW);
col=round(dim(2)/2)-90;         %������ʼ��������
row=find(BW(:,col),1);          %������ʼ��������
connectivity=8;
num_points=180;
contour=bwtraceboundary(BW,[row,col],'N',connectivity,num_points);
%��ȡ�߽�
figure
imshow(I1);
hold on;
plot(contour(:,2),contour(:,1), 'g','LineWidth' ,2);
title('�߽����ͼ��');