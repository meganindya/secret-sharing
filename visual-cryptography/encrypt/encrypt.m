clc; clear;

A = imread('MESSAGE.bmp');
[H W] = size(A);

M(:, :, 1) = [0, 1; 0, 1];
M(:, :, 2) = [1, 0; 1, 0];

S = zeros(H, W, 2);

for I = 1 : H
  for J = 1 : W
    T = round(rand);
    if A(I, J) == 1
      S = fillPos(S, I, J, M(:, :, 1 + T), M(:, :, 2 - T));
    else
      S = fillPos(S, I, J, M(:, :, 1 + T), M(:, :, 1 + T));
    end
  end
end

imwrite(logical(S(:, :, 1)), 'SHARE1.bmp');
imwrite(logical(S(:, :, 2)), 'SHARE2.bmp');

clear;
disp('SHARES generated successfully!');
