% init2.m
% ���ļ�Ϊ model2 �ĳ�ʼ������
clc;
clear;

% depth2 = xlsread('A�⸽��.xls','����3');
load depth
load depth2
pic = load('1.dat');

pixel_length = 100 / 256;
deltx_value = 0.277429210100547;
kValue = 1.776812774001533;
% ��һ��ģ����������������Ҳ����͸���ԣ����Բ���Ҫͨ��kValueתΪ������Ϣ
% depth2 = depth2 ./ kValue;
% depth = depth ./ kValue;

load theta
theta = theta;
load position
pos_pix = pos/pixel_length;
% 
theta_deg = rad2deg(theta)-90;



