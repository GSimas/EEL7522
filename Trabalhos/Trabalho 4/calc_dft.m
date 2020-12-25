%UNIVERSIDADE FEDERAL DE SANTA CATARINA - UFSC
%CENTRO TECNOLÓGICO - CTC
%DEPARTAMENTO DE ENGENHARIA ELÉTRICA E ELETRÔNICA
%EEL7522 - PROCESSAMENTO DIGITAL DE SINAIS
%GUSTAVO SIMAS & ANDRÉ MATTOS

%DTFT - Discrete Time Fourier Transform

x = [1, 1, 1, 1, zeros(1,60)]; 
N = 64;
X = fft(x, N);
magX=abs(X);
phaX=angle (X)*180/pi;
f=0:1/N:(N-1)/N; % frequência normalizada
subplot(2,1,1)
plot(f,magX)
title('Magnitude de X(k)')
grid
subplot(2,1,2)
plot(f,phaX)
title('Fase de X(k)')
grid


N=100
n = 0:N-1;
x = cos(0.48*pi*n)+cos(0.5*pi*n);
figure(2)
subplot(2,1,1)
stem(n, x);
grid
title('Sinal x(n)');
xlabel('n');
X = fft(x,N);
magX = abs(X);
k = 0:N-1;
w = (2*pi/N)*k;
subplot(2,1,2)
plot(w,magX);
grid
title('Magnitude da DFT');
xlabel('frequencia(rd))');

n2 = [0:N+411];
y1 = [x zeros(1,412)];
subplot(2,1,1);
stem(n2,y1);
grid
title('sinal x(n), 412 zero padding');
xlabel('n');
Y1 = fft(y1,512);
magY1 = abs(Y1);
k2 = 0:N+411;
w = (2*pi/(N+412))*k2;
subplot(2,1,2);
plot(w,magY1);
grid
title('Magnitude da DFT');
xlabel('Frequência(rd)');


figure(4)
x = ifft(X, N);
stem(n, x);
title('Sinal x(n) ');
xlabel('n');
grid
z = fftshift(x)
z2 = fftshift(X)
figure(5)
subplot(2,1,1);
stem(n,z)
title('Sinal x(n) ');
grid
subplot(2,1,2);
stem(n,z2)
title('Magnitude da FFT');
grid

function Xk = dft(xn, N)
% Cálculo da Transformada de Fourier Discreta
% ----------------------------------------------
% [Xk] = dft(xn, N)
% Xk = vetor de N valores da DFT 0 <= k <= N-1
% xn = vetor de N valores da IDFT
% N = comprimento da DFT DFT
%
n = 0:N-1; % vetor linha para n
k = 0:N-1; % vetor linha para k
WN = exp(-1i*2*pi/N); % fator Wn
nk = n'*k; % cria uma matriz NxN de nk valores
WNnk = WN.^ nk; % Matriz DFT
Xk = xn*WNnk; % vetor linha para os valores da DFT
% Fim da função
end

function xn = idft(Xk, N)
% Cálculo da Transformada de Fourier Discreta Inversa
% -------------------------------------------
% [xn] = idft(Xk, N)
% xn = a sequência de N pontos 0 <= n <= N-1
% Xk = Os valores da DFT 0 <= n <= N-1
% N = comprimento da DFT
%
n = 0:N-1; % vetor linha para n
k = 0:N-1; % vetor linha para k
WN = exp(-1i*2*pi/N); % fator Wn
nk = n'*k; % cria uma matriz NxN de nk valores
WNnk = WN.^(-nk); % Matrix IDFT
xn = (Xk*WNnk)/N; %vetor linha dos valores da IDFT
% Fim da função
end
