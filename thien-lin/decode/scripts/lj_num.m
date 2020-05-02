% this function finds the numerator of the
% jth l(x) in lagrange interpolation polynomial

% initially call lj_num(j, m) for jth polynomial's
% numerator with m as the number of polynomials

function retval = lj_num(x, j, m)
  f = 1;
  for p = 1 : m
    if p == j
      continue;
    end
    f = conv(f, [1, -x(p)]);
  end
  retval = f;
end