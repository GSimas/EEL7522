%UNIVERSIDADE FEDERAL DE SANTA CATARINA - UFSC
%CENTRO TECNOLÓGICO - CTC
%DEPARTAMENTO DE ENGENHARIA ELÉTRICA E ELETRÔNICA
%GUSTAVO SIMAS & ANDRÉ MATTOS

%TRANSFORMADA Z

clear all, close all

% 
% H'(z)=z.H(z) : fração parcial 
% 
b = [1 -2.5 1];
a = [0.7 -1 1 0];
[r,p,k] = residue(b,a);
%[d,c] = residue(r,p,k) 		% Test (check if d=b and a=c)
r
p

% 
% G'(z)=z.G(z) : fração parcial  
%
b = [0.7 -1 1];
a = [1 -2.5 1 0];
[r,p,k] = residue(b,a);
%[d,c] = residue(r,p,k) 		% Test (check if d=b and a=c)
r
p
