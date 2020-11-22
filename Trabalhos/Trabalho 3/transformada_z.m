%UNIVERSIDADE FEDERAL DE SANTA CATARINA - UFSC
%CENTRO TECNOLÓGICO - CTC
%DEPARTAMENTO DE ENGENHARIA ELÉTRICA E ELETRÔNICA
%GUSTAVO SIMAS & ANDRÉ MATTOS

%TRANSFORMADA Z

clear all, close all
load mtlb
who
X = -10:1:10;
unitstep1 = zeros(size(X));
unitstep1(X>=-1) = 1;
h = 0.2*0.5.^(X).*unitstep1-1.2*3.^(X).*unitstep1;
figure(1)
stem(X,h)
title('Resposta ao impulso discreta h[n]')
grid on
figure(2)
g1 = -1.5.*(dirac(X-2) == Inf);
g2 = 3.5.*(dirac(X-1) == Inf);
g3 = -1.*(dirac(X) == Inf);
g = g1 + g2 + g3;
stem(X,g)
title('Função g[n] (inverso de h[n]')
grid on
w = conv(h,g, 'same');
figure(3)
stem(X,w)
grid on
title('Convolucao entre g[n] e h[n]')