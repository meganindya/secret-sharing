% this function finds the denominator of the
% jth l(x) in lagrange interpolation polynomial

% initially call lj_den(j, m) for jth polynomial's
% denominator with m as the number of polynomials

function retval = lj_den(x, j, m)
  f = 1;
  for p = 1 : m
    if p == j
      continue;
    end
    f = f * (x(j) - x(p));
  end
  retval = f;
end