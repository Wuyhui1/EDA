
clc;
close all;
load A;
%load B;
%load C;
GKT=xlsread('������·���г�ʱ��.xlsx');
popsize= 500;                  % ��Ⱥ��ģ
maxgen= 1000;                   % ����������
citysize=82;        % ��������
TJ=3;               %���ʱ��
p= ones(citysize, citysize);   % ���ʾ���
sn= ceil(popsize * 0.5);       % ����Ⱥ���ģ
bestlists= zeros(maxgen, citysize);    % ��¼ÿ�����Ž�
bestfits= zeros(1, maxgen);            % ��¼ÿ�����Ž���Ӧ��ֵ
avgfits= zeros(1, maxgen);% ��¼ÿ��ƽ����Ӧ��ֵ
bfit1=100;
for gen =1:maxgen
    pop = makepop(popsize, citysize, p);    % ������Ⱥ
    [fitness, lenjz]= callength(pop,popsize,A,GKT,TJ);
    [bfit, bfiti] = min(fitness);
    if bfit<bfit1
       bfit1=bfit;
       bfiti1=bfiti;
       Dbest=pop(bfiti1, :);
    end 
    bestlists(gen, :) = Dbest;
    bestfits(1, gen) = bfit1;
    avgfits(1, gen) = sum(fitness) / popsize;
    spop = selection(pop, sn, fitness);     % ѡ������Ⱥ��
    p = makep(spop);                        % ���¸��ʾ���
end
Zuiyoujie=bestlists(end,:);

FIT=bestfits*2.5;
FIT=FIT';
figure
plot(bestfits,'-b');
title('�ֲ������㷨�Ż���Ӧ������');
xlabel('��������');
ylabel('Fitness value/min');
%[fitness,lenjz] =callength(bestlists,popsize,A,B,C);

%[bfit, bfiti]= min(fitness);
%fprintf("��̾���:%f\n", bfit);