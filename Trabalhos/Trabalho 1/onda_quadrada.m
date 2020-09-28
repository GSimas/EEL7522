%UNIVERSIDADE FEDERAL DE SANTA CATARINA - UFSC
%CENTRO TECNOLÓGICO - CTC
%DEPARTAMENTO DE ENGENHARIA ELÉTRICA E ELETRÔNICA
%GUSTAVO SIMAS & ANDRÉ MATTOS

%SIMULACAO DE SINAL ONDA QUADRADA POR SERIE DE FOURIER

clear all, close all, clc
N = 151; %número de harmonicas (deve ser um número ímpar)
T = 20;% período em segundos
t = linspace(0,T,1000);%vetor de tempo
x = 0;l = 0;
for k = -((N-1)/2):((N-1)/2)
 l = l + 1;
 if k ~= 0
 x = x + (1-cos(k*pi))*exp(j*k*2*pi*t/T)/(j*k*pi);%sinal
 ak(l) = (1-cos(k*pi))./(j*k*pi);% coeficientes da série
 end
 if k == 0, x = 0 ; ak(l) = 0; end
end
xn=0.5*[ones(1,500) -ones(1,500)];
k = -((N-1)/2):((N-1)/2);
kw=k*2*pi/20; %vetor de frequências
figure(1),plot(t,real(x),t,xn,'r');grid
title('Onda quadrada exata e truncada')
xlabel('tempo(s)')
ylabel('Amplitude')
figure(2),stem(kw,abs(ak)); grid
title('|a_k|')
xlabel('Freqência (k.\omega_0)')
figure(3),stem(kw,angle(ak)); grid
title('\phi_k')
xlabel('Freqência (k.\omega_0)')
%
erro = (x-xn).^2;
%
seq = sum(erro) % erro quadrático
