%绘制不同炮射程与发射角关系图%
%% 初始化 %%
clc %清除命令窗口的内容
clear %清除工作空间的所有变量
clear all %清除工作空间的所有变量，函数，和MEX文件
clf %清除当前的Figure
close %关闭当前的Figure窗口
close all %关闭所有的Figure窗口
a = 0:0.001:0.5*pi; %定义一个一维数组a

%% 绘制单稍炮曲线 %%
%定义变量%
F = 4000;
l = 8;
l0 = 6;
m1 = 1.25;
m2 = 30;
g = 9.8;
theta = asin(2/3);
%计算%
j = m2.*l.^2./12+m2.*(l0-l./2).^2;%计算转动惯量
w = sqrt((F.*(l-l0)-m1.*g.*l0-m2.*g.*(l0-l./2)).*(sin(a)+sin(theta))./(m1.*l0.^2./2+m2.*(l0-l/2).^2+j./2));%计算角速度
t = (w.*l0.*cos(a)+sqrt(w.^2.*l0.^2.*cos(a).^2+2.*g.*l0.*(sin(a)+sin(theta))))./g;%计算时间
s1 = w.*l0.*t.*sin(a)-l0.*cos(a);%计算水平方向位移

%% 绘制七稍炮曲线 %%
%定义变量%
F = 25000;
l = 9;
l0 = 7;
m1 =56.25;
m2 = 150;
g = 9.8;
theta = asin(6/7);
%计算%
j = m2.*l.^2./12+m2.*(l0-l./2).^2;%计算转动惯量
w = sqrt((F.*(l-l0)-m1.*g.*l0-m2.*g.*(l0-l./2)).*(sin(a)+sin(theta))./(m1.*l0.^2./2+m2.*(l0-l/2).^2+j./2));%计算角速度
t = (w.*l0.*cos(a)+sqrt(w.^2.*l0.^2.*cos(a).^2+2.*g.*l0.*(sin(a)+sin(theta))))./g;%计算时间
s2 = w.*l0.*t.*sin(a)-l0.*cos(a);%计算水平方向位移

%% 绘图 %%
plot(a,s1,a,s2,LineWidth=1);%绘制两条曲线
title('不同炮射程与发射角关系图','FontSize',14); %给图添加标题
xlabel('发射角\alpha(rad)'); %给x轴添加标签
ylabel('射程S(m)'); %给y轴添加标签
set(gca,'xtickLabel',{'0','0.0625π','0.125π','0.1875π','0.25π','0.3125π','0.375π','0.4375π','0.5π'}); %改变x轴单位
grid on; %给图添加网格
legend('单梢炮','七梢炮');%给图添加图例
