Img = double(imread('Public_Image.bmp'));
I1 = double(imread('Image1.bmp'));
I2 = double(imread('Image2.bmp'));
I3 = double(imread('Image3.bmp'));
I4 = double(imread('Image4.bmp'));
I5 = double(imread('Image5.bmp'));

[x y] = size(Img);
for P = [1 : 5 : x]
  for Q = [1 : 5 : y]
    B = ([I1(P:P+4,(Q+4)/5) I2(P:P+4,(Q+4)/5) I5(P:P+4,(Q+4)/5)]);
    I_dash = mod(B'*B,251);
    adj = round(mod(inv(I_dash)*det(I_dash),251));
    Inverse = adj*mulinv(mod(round(det(I_dash)),251),251);
    Inverse = mod(Inverse,251);
    Proj_B = mod(B*Inverse*B',251);
    Img(P:P+4,Q:Q+4) = double(mod(Img(P:P+4,Q:Q+4)+Proj_B,251));
  end
end
imshow(uint8(Img));
imwrite(uint8(Img),'DecodedImage.bmp');
