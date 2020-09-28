%UNIVERSIDADE FEDERAL DE SANTA CATARINA - UFSC
%CENTRO TECNOLÓGICO - CTC
%DEPARTAMENTO DE ENGENHARIA ELÉTRICA E ELETRÔNICA
%GUSTAVO SIMAS & ANDRÉ MATTOS

%SIMULACAO DE SINAL ONDA QUADRADA POR SERIE DE FOURIER FILTRADA POR
%CIRCUITO RC

clear all, close all, clc
N = 51;% número de harmonicas (impar)
T = 20; % Período
t = linspace(0,T,1000); %vetor de tempos
x = 0;y = 0;l = 0;
tau = 0.01;
for k = -((N-1)/2):((N-1)/2)
 l = l + 1;
 if k ~= 0
 y = y + (1/(1+j*k*(2*pi/T)*tau))*(1-cos(k*pi))*exp(j*k*2*pi*t/T)/(j*k*pi); %sinal de saída
 x = x + (1-cos(k*pi))*exp(j*k*2*pi*t/T)/(j*k*pi); %sinal de entrada
 ak(l) = (1-cos(k*pi))./(j*k*pi); %coeficientes da série de Fourier do sinal de entrada
 ck(l) = (1/(1+j*k*(2*pi/T)*tau))*(1-cos(k*pi))./(j*k*pi);%coeficientes da série de Fourier do sinal de saída
 end
 if k == 0, y = 0; x = 0; ak(l) = 0; ck(l) = 0; end
end
xn=0.5*[ones(1,500) -ones(1,500)];
k = -((N-1)/2):((N-1)/2);
kw=k*2*pi/T; %vetor de frequências
figure(1),plot(t,real(x),t,real(y),'k',t,xn,'r')
hleg1 = legend('sinal de entrada','sinal de saída','onda quadrada');
xlabel('tempo(s)')
grid on
figure(2), stem(kw,abs(ak))
hold on
stem(kw,abs(ck),'k')
hold off
hleg1 = legend('|a_k|','|c_k|');
xlabel('Frequência (k.\omega_0)')
grid on
figure(3), stem(kw,angle(ak))
hold on
stem(kw,angle(ck),'k')
hold off
hleg1 = legend('|\phi_k|','|\theta_k|');
xlabel('Frequência (k.\omega_0)')
grid on


