%����deltx��̽������Ԫ��ľ��룩
xmatrix = b; %b�Ǹ���2�����ݾ���
h_vec = [];
for i = 1:180
    h = sum(xmatrix(:,i));
    h_vec = [h_vec h];
end
Havr = sum(h_vec)/1.7768/180;
Sreal = pi*40*15 + pi*4*4;
deltxvalue = Sreal/Havr;

    
    
    
