%UNIVERSIDADE FEDERAL DE SANTA CATARINA - UFSC
%CENTRO TECNOLÓGICO - CTC
%DEPARTAMENTO DE ENGENHARIA ELÉTRICA E ELETRÔNICA
%GUSTAVO SIMAS & ANDRÉ MATTOS

%Convolução usando residue (sistema discretos)

clear all, close all


n = 0:1:50;
delta = [1 zeros(1,50)];
degrau = [0 ones(1,50)];
hn = (delta - (0.82157*exp(2.28104i).*((-0.8367*exp(0.93025i)).^(n-1)).*degrau) - (0.82157*exp(-2.28104i).*((-0.8367*exp(-0.93025i)).^(n-1)).*degrau));
gn =  delta - 0.3.*((0.5).^(n-1)).*degrau + 1.8.*((2).^(n-1)).*degrau;

n = 0:1:100;
result = conv(hn, gn);

%
% Tentativa alternativa de convolucao
% t = 0:1:100;
% gn_c =  (delta - 0.3.*((0.5).^((t-n)-1)).*degrau + 1.8.*((2).^((t-n)-1)).*degrau);
% result = integral(@(t) hn.*gn_c, 0, 100,'ArrayValued', true);
%

figure(1);
stem(n, result);
grid on

z = -100:1:100;
Hz=( 1 - 2.5.*z.^(-1) + z.^(-2) ) ./ ( 1 - z.^(-1) + 0.7.*z.^(-2) );
Gz=( 1 - z.^(-1) + 0.7.*z.^(-2) ) ./ ( 1 - 2.5.*z.^(-1) + z.^(-2) );

figure(2);
stem(z, (Hz.*Gz));
grid on


%
% hn oliver
% hn = (delta + ((-0.75 + 0.3345i).*((0.5 + 0.6708i).^(n-1)).*degrau) + ((-0.75 - 0.3345i).*((0.5 - 0.6708i).^(n-1)).*degrau));
%