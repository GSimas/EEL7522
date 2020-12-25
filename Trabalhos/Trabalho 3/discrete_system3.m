%UNIVERSIDADE FEDERAL DE SANTA CATARINA - UFSC
%CENTRO TECNOLÓGICO - CTC
%DEPARTAMENTO DE ENGENHARIA ELÉTRICA E ELETRÔNICA
%GUSTAVO SIMAS & ANDRÉ MATTOS

%Plot usando freqz (sistema discretos)

clear all, close all

z = -100:1:100;
Hz=( 1 - 2.5.*z.^(-1) + z.^(-2) ) ./ ( 1 - z.^(-1) + 0.7.*z.^(-2) );
Gz=( 1 - z.^(-1) + 0.7.*z.^(-2) ) ./ ( 1 - 2.5.*z.^(-1) + z.^(-2) );

figure(1);
freqz(Hz);
grid on

figure(2);
freqz(Gz);
grid on