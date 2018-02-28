%% mask_search.m
% �ú�������ȷ��ĳ��ͼ����͹��
% ������ɢ֮�����ͨ��������Щ��Ķ�����ܲ�ͬ����������������ܻ��ĨȥĳЩϸ��

init_matrix = depth2;
%% ����
% Ϊ�����matlab�����ú������� �Ƚ���һ�β�ֵ��ȡ��ÿ��������ص�ֵ�����ǰѼ����deltX��Ϊ��ࣩ
% �ò�����model2��ͬ,���ڶ�����ľ��Ⱥ��ٶ�Ҫ��ͬ���ﲻ������һ�εĲ�ֵ
sample_length = pixel_length/deltx_value;
% sample = interp1(1:512,init_matrix,sample_point,'linear');
sample = init_matrix;
size_sample = size(sample);


%% ���
% ����Ĵ�С
size_result = 400;
size_pic = size_sample(1);
pic_result = ones(size_result,size_result);
  m = [];

for i=1:size_result
    for j=1:size_result
% for i=125
%     for j=125
        % ����õ㵽ֱ�ߵĽǶȺ;���
        flag = 0;
        length = sqrt((i - (1+size_result)/2)^2 + (j - (1+size_result)/2)^2);
               
        theta2 = atan((i - (1+size_result)/2)/(j - (1+size_result)/2));
        if j >(1+size_result)/2
            theta2 = theta2 +pi;
        end
%         m = [m,theta2];

          for k=1:5:180
%           for k=170
            theta_now = theta(k);
            
            %��õ���ֱ����ͶӰ��λ��
%             t=length * cos(theta2 + theta_now) - pos_pix(k);            
            t=length * cos(theta2 + theta_now - pi/2)*sample_length;
%              m = [m,t];


            % ���ھͽ�����������ж�
            flag1 = 0;
            for t1 = floor(size_pic/2 + t):floor(size_pic/2+t+1) 
                if (t1 > size_pic) || (t1 < 1)            % ����õ���������
                    flag = 1;
                    break;
                end
                if sample(t1,k) > 0
                    flag1 = flag1 + 1;
                end
            end
            if flag1 == 0
                flag = 1;
                break;
            end
         end
         if flag ==1
            pic_result(size_result+1-i,size_result+1-j) = 0;
        end
    end
end
imshow(pic_result);
hold on;



%%
%�ü�
result_cut = pic_result(round(centerX - 256/2):round(centerX + 255/2),round(centerY - 256/2):round(centerY + 255/2));
figure
imshow(result_cut)
