function retval = modLagPol(y, x, v)
  m = length(y);
  a = []; b = [];
  
  for p = 1 : m
    a = [a; lj_num(x, p, m)];
    b = [b; lj_den(x, p, m)];
  end
  
  num = [0];
  den = max(abs(b));
  
  for p = 1 : m
    t = a(p, :) * (den / b(p));
    num = num + (y(p) * t);
  end
  
  f = [];
  for p = 1 : m
    f = [f; modFrac(num(p), den, v)];
  end
  
  retval = f;
end