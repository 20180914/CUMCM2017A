%% ģ�Ͷ�
% ��ͶӰ
% thetaΪ��model1������ĽǶ�ֵ �� 1*180 �ľ���
% depth2 Ϊ 512*180 �ľ���


%depth2 = [zeros(100,180); depth2; zeros(100,180)];
%imagesc(phantom)
% figure
thera_deg = rad2deg(theta);
figure(2),  I = iradon(depth2, thera_deg,'none','shepp-logan',deltx_value);
 %I = iradon(depth2, thera_deg);
 imshow(I,[]);