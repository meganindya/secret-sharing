% to get modulo inverse of a w.r.t. m
% initially call invMod(a, m - 2, m)

function retval = invMod(x, y, m)
  if y == 0
    retval = 1;
    return;
  end
  
  p = mod(invMod(x, floor(y / 2), m), m);
  p = mod(p * p, m);
  
  if mod(y, 2) == 0
    retval = p;
  else
    retval = mod(x * p, m);
  end
end