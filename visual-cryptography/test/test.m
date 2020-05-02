clc; clear;

A = imread('SHARE1.bmp');
B = imread('SHARE2.bmp');

M = A + B;
[H W] = size(M);

imwrite(logical(M), 'TEST.bmp');

clear;
disp('Regenerated!');
