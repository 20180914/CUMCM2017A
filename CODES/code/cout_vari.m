function [ output_args ,result ] = cout_vari( theta,pos,depth )
%cout_vari ����theta��pos��Ӧ������������ֵ֮���ŷʽ����
% depth 1*512 ������
% result ���ڼ���
result = [];
deltx_value = 0.277429210100547;%���
% deltx_value = deltx_value*cos()
%kValue = 1.776812774001533;
t = - pos *deltx_value - deltx_value * 513/2;
for index = 1:512
    t = t + deltx_value;
    result = [result,ideal_result(theta, t)];
end
output_args = pdist2(result,depth);
%��ע�͵��ļ�麯����
%plot(result);
%hold on;
%plot(depth);
end

