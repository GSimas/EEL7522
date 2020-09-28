%UNIVERSIDADE FEDERAL DE SANTA CATARINA - UFSC
%CENTRO TECNOLÓGICO - CTC
%DEPARTAMENTO DE ENGENHARIA ELÉTRICA E ELETRÔNICA
%GUSTAVO SIMAS & ANDRÉ MATTOS

%SIMULACAO DE SINAL DENTE DE SERRA POR SERIE DE FOURIER

clear all, close all, clc
N = 50;% número de harmônicas
T = 2;% período
t = linspace(0,2*T,1000);% vetor de tempo
xaux = 0;
for k = 1:N
xaux = xaux + (1/(k*pi))*cos(k*(2*pi/T)*t+pi/2);
end
x = 1/2+xaux;% sinal x(t)aproximad0
t1= linspace(0,T,500);
x1 = t1/2;
xn=[x1 x1];% sinal x(t) exato
plot(t,x,t,xn); grid
%
erro = (x-xn).^2;
%
seq = sum(erro) % erro quadrático