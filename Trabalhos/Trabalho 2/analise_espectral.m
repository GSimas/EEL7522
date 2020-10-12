%UNIVERSIDADE FEDERAL DE SANTA CATARINA - UFSC
%CENTRO TECNOLÓGICO - CTC
%DEPARTAMENTO DE ENGENHARIA ELÉTRICA E ELETRÔNICA
%GUSTAVO SIMAS & ANDRÉ MATTOS

%ANÁLISE ESPECTRAL

clear all, close all
load mtlb
who
L=length(mtlb);
figure(1)
plot([1:L]/Fs,mtlb)
axis tight
xlabel('Tempo (segundos)')
load('NoisySpeech.txt');
%soundsc(mtlb)
x= NoisySpeech;
L=length(x);
figure(2)
plot([1:L]/Fs,x)
axis tight
title('Sinal de voz ruidoso')
xlabel('Tempo (segundos)')
soundsc(x)
M=fft(mtlb,8192); % espectro entre 0 e Fs Hz 
M=fftshift (M); % espectro entre -Fs/2 e Fs/2 
R=fft(x,8192); 
R=fftshift (R); 
f=((-4096:4095)/8192)*Fs/2;
figure(3)
plot(f,abs(R)) 
xlabel('Frequência (Hz)') 
grid 
hold on 
figure(4)
plot(f,abs(M), 'r')
grid

