% initially call modFrac(numerator, denominator, modulo)

function retval = modFrac(a, b, m)
##  if b < 0
##    b = b * (-1);
##    a = a * (-1);
##  end
  b = invMod(b, m - 2, m);
  
  retval = mod(mod(a, m) * mod(b , m), m);
end