clear;

K = 3; N = 5;

A = imread('MESSAGE.jpg');
[H W] = size(A);
W = W / K;

B = zeros(H, W, K);
for P = 1 : H
  for Q = 1 : W
    for R = 1 : K
      B(P, Q, R) = A(P, Q + (W * (R - 1)));
    end
  end
end

C = zeros(H, W, N);
for P = 1 : H
  for Q = 1 : W
    Y = [];
    for R = 1 : K
      Y = [Y B(P, Q, R)];
    end
    
    for R = 1 : N
      C(P, Q, R) = polyval(Y, R);
      C(P, Q, R) = mod(C(P, Q, R), 251);
    end
  end
end
C = uint8(C);

D = 'KEYS';
mkdir(D);
for R = 1 : N
  fname = strcat(D, '/', 'K', num2str(R), '.bmp');
  imwrite(C(:, :, R), fname);
end

clear;
disp('-- Keys Successfully Generated');