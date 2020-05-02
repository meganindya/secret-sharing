I = imread('Lena_test.png');
[x y] = size(I);
I = double(I);
I = (I-(I>250).*I) + (I>250)*250;
m=5;
k=3;
count=0;
if(mod(x,m)!=0)
  for A = [1:m-mod(x,m)]
    count++;
    I = [I;zeros(1,y)];
  end
end
if(mod(y,m)!=0)
  for A = [1:m-mod(y,m)]
    I = [I zeros(1,x+count)'];
  end
end
[x y] = size(I);
Shares = zeros(x,y/m,m);
for P = [1:5:x]
  for Q = [1:5:y]
    A = randi(250,m,k);
    I_dash = mod(A'*A,251);
    Check = round(mod(det(I_dash),251));
    while (rank(A)!=k || (Check==0 || Check==251))
      A = randi(250,m,k); 
      I_dash = mod(A'*A,251);
      Check = round(mod(det(I_dash),251));
    end
    X = [191 78 0 0 217;117 250 67 154 0;0 0 12 90 88];
    adj = round(inv(I_dash)*det(I_dash));
    adj = mod(adj,251);
    Inverse = adj*mulinv(round(det(I_dash)),251);
    Inverse = mod(Inverse,251);
    Proj_A = mod(A*Inverse*A',251);
    for L = [1:m]
      Shares(P:P+4,(Q+4)/5,L) = mod(A*X(:,L),251);
    end
    I(P:P+4,Q:Q+4) = mod(I(P:P+4,Q:Q+4)-Proj_A,251);
  end
end
imshow(uint8(I));
imwrite(uint8(I),'Public_Image.bmp');
for L = [1:m]
  figure
  imshow(uint8(Shares(:,:,L)));
  name = strcat("Image",int2str(L),".bmp");
  imwrite(uint8(Shares(:,:,L)),name);
end
