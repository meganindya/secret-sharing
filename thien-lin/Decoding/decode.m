clear;

K = 3;
D = 'KEYS';
S = dir(fullfile(D, '/*.bmp'));
R = size(S, 1);
if R < K
  disp('-- Insufficient Number of Keys');
  return;
end

F = char([]);
for P = 1 : numel(S)
  F = [F; fullfile(S(P).name)];
end

X = [];
for P = 1 : size(F, 1)
  X = [X; (F(P, 2) - uint8('0'))];
end
X = double(X);

[H W] = size(imread(strcat(D, '/', F(1, :))));
A = zeros(H, W, R);

for P = 1 : R
  A(:, :, P) = imread(strcat(D, '/', F(P, :)));
end

mkdir('temp');
save('temp/variables.mat', 'A', 'K', 'H', 'W', 'R', 'X');

addpath(genpath('scripts'));
genResult;

clear;
disp('-- Message Successfully Recovered');