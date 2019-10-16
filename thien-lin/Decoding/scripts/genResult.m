clear;
load('.\temp\variables.mat');

A = double(A);
I = zeros(H, W * K);

for M = 1 : H
  for N = 1 : W
    Y = [];
    for O = 1 : R
      Y = [Y; A(M, N, O)];
    end
    
    Z = modLagPol(Y, X, 251);
    Z = Z((R - K + 1) : end);
    
    for O = 1 : K
      I(M, N + (W * (O - 1))) = Z(O);
    end
  end
end
I = uint8(I);

imwrite(I, 'MESSAGE.jpg');

rmpath('scripts');