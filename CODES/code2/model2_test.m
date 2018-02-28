%% ģ�Ͷ�
% model2_test.m
% ������Ŀ���ǽ���ģ��һ �Է�ͶӰ��صĸ����˲��Ͳ�ֵ�㷨��������
% thetaΪ��model1������ĽǶ�ֵ �� 1*180 �ľ���
% depth Ϊ 512*180 �ľ���
init_matrix = depth;

%% ���

% Ϊ�����matlab�����ú������� �Ƚ���һ�β�ֵ��ȡ��ÿ��������ص�ֵ�����ǰѼ����deltX��Ϊ��ࣩ
% ������
sample_length = pixel_length/deltx_value/2;
sample_point = 1:sample_length:512;
sample = interp1(1:512,init_matrix,sample_point,'linear');
size_sample = size(sample);

% ������ⷶΧ
% t = floor((sqrt(2)-1)*size_sample(1)/2);
 t = 90;
sample = [zeros(t,size_sample(2)); sample; zeros(t,size_sample(2))];
% I0 = iradon(sample, theta_deg);
I0 = iradon(sample, theta_deg,'none','none',deltx_value);
% I0 = iradon(sample, theta_deg,'spline','none',deltx_value);
% I0 = relvbo(sample, theta_deg,'pchip','zhishu',deltx_value,1500,0.21,0.5,0.5);
size_I0 = size(I0);
%��ת���ĵ�λ��(I���е�����ת����)
% y0 = 8.3059;
% x0 = 7.5048;
y0 = 9;
x0 = 6;
centerX = round(x0*2/pixel_length + (1+size_I0(1))/2);
centerY = round(y0*2/pixel_length + (1+size_I0(2))/2);
% plot(centerX,centerY,'or');
% rectangle('Position',[centerX-256,centerX+255,512,512]) 
% ����Բ����Ϊ����ȡ��512���㼴Ϊ����
n = 512;
%n = 256;
I = I0(centerX-n/2+1:2:centerX+n/2-1,centerY-n/2+1:2:centerY+n/2-1);
%֮ǰ��Ķ����ӵ�2t���հ׵�����Դ��� - ��������ԭ��������ÿ�����ߵ�Ӱ�����
%�����������
I = I .*((512+2*t)/512);
imshow(I,[]);
hold on
plot(centerX,centerY,'or');

%% ����
% ����ʹ�ù�һ�������о�


I_sample = I*4;%�������Ϊ ����˫����ȡ���� 
result = reshape (I_sample',1,[]);
% figure(2);
% %�в�ͼ
% input = reshape (pic',1,[]); % pic model1����״
% imshow(I_sample-pic,[]);
% 
% 
% delt1 = sum((input - result).^2);
% delt2 = sum((input - mean(input)).^2);
% 
% if delt2 ~= 0
%     %�����
%     distance = sqrt(delt1/delt2);
% end
% distance

%% ����
t1 = [];
% for i = 2:7
%    [Idx,C,sumD]=kmeans(result',i);
%    t1 = [t1,sum(sumD)];
% end 

 [Idx,C,sumD]=kmeans(result',2);
%  class = reshape(Idx,256,256);
%  class = class';
%  % ���
%  temp = (2-class) - pic;
%  imshow(abs(temp));
%  