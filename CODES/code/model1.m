%%
%�˴������֮ǰ���г���ȷ����ģ�ͽ��н�һ������������ģ�͵ľ���
%������� theta_0 pos_0 Ϊ 1*180 ��������ȷ��������ʼ��
%������� theta_step pos_step Ϊ 1*n �ľ��󣬱�ʾ������Χ�Ͳ���

%deltvalue Ϊ������֮��ľ���
%depth Ϊ512*180�ľ�����ÿ����������ӦX�⾭������������ĳ���

%������� warning_flag ��ʾ ��Сֵ�ڱ߽紦ȡ���������������ֵ����˵��������ʼ�㾫�Ȳ��ߣ���Ҫ����ȷ����������������������Χ
%������� theta pos Ϊģ�͵Ľ�


%%
%��ʼ��
record = [];
theta_0 = [];
pos_0 = [];
miu = pi/180;
% for i = 1:180
%     theta_0 = [theta_0, miu*i - deg2rad(26.5778 - 146.18836)];
%     pos_0 = [pos_0,-0.4+18.10*cos(miu*i)-36.18*sin(miu*i)];
% end
theta_0 = theta;
pos_0 = pos;
warning_flag = [];
theta_step = 0;
pos_step = 0;
%theta �ö���
%
deg1 = deg2rad(1);

% С���������ڼ���
% theta_step = -1:0.5:1;
% pos_step =  -2:0.5:2;

%��������
% theta_step = -2:0.05:0;
% pos_step =  -2:0.05:2;

theta_step = theta_step * deg1;

% theta = zeros(1,180);
% pos = zeros(1,180);
result_check = zeros(length(theta_step),length(pos_step));

mark = [];
%%
%������
for index = 1:180
    vari_mark = inf;
    for theta_index = 1:length(theta_step)
        theta_temp = theta_0(index) + theta_step(theta_index);
        for pos_index = 1:length(pos_step)            
            pos_temp = pos_0(index) + pos_step(pos_index);
            %ͳ�ƶ�ά���
            result_check(theta_index,pos_index) =pos_temp;
            %��������ֵ��ʵ��ֵ֮��ľ���
            [vari_temp,n] = cout_vari(theta_temp,pos_temp,depth(:,index)');
            %result_check = [result_check;n];
%             vari_temp = cout_vari(theta_temp,pos_temp,depth(:,index)');
            record = [record, vari_temp];
            mark = [mark,n'];
            % ����õ����ӽ������
            if vari_temp < vari_mark
                vari_mark = vari_temp;
                theta_mark = theta_temp;
                pos_mark = pos_temp;
            end            
        end
    end
    %����Ǳ߽�
%     if  (theta_mark - theta_0(index)) == theta_step(1)|| (theta_mark - theta_0(index)) == theta_step(length(theta_step))||...
%             (pos_mark - pos_0(index)) == pos_step(1)|| (pos_mark - pos_0(index)) == pos_step(length(pos_step))
%         warning_flag = [warning_flag,i];
%     end
%     theta(index) = theta_mark;
%     pos(index) = pos_mark;
%     
end

% %%
% disp('�����������')
% length(warning_flag)
% 
% figure(1)
% plot(theta_0,'r');
% hold on;
% plot(theta,'b');
% hold on;
% figure(2)
% plot(pos_0,'r');
% hold on;
% plot(pos,'b');
% save('theta','theta');
% 
% save('postion','pos');
% record = reshape(record,length(pos_step),length(theta_step));
% theta_step  = theta_step+ theta_0(1);
% pos_step  = pos_step+ pos_0(1);
% [xa,ya] = meshgrid(theta_step,pos_step);
% mesh(xa,ya,record);
% hold on;
% xlabel('theta')
% ylabel('��Բ����λ��')
% zlabel('��ʵ��λ��֮��ľ���')