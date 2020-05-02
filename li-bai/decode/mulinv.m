function retval = mulinv (X, p)
  I = 1;
  while (true)
    if (mod(X * I, p) == 1)
      retval = I;
      break;
    end
    I++;
  end
end
