function retval = fillPos(G, Y, X, P, Q)
  H = G;
    # Row 1 Col 1
  H(2 * Y - 1, 2 * X - 1, 1) = P(1, 1);
  H(2 * Y - 1, 2 * X - 1, 2) = Q(1, 1);
    # Row 1 Col 2
  H(2 * Y - 1, 2 * X - 0, 1) = P(1, 1);
  H(2 * Y - 1, 2 * X - 0, 2) = Q(1, 1);
    # Row 2 Col 1
  H(2 * Y - 0, 2 * X - 1, 1) = P(1, 1);
  H(2 * Y - 0, 2 * X - 1, 2) = Q(1, 1);
    # Row 2 Col 2
  H(2 * Y - 0, 2 * X - 0, 1) = P(1, 1);
  H(2 * Y - 0, 2 * X - 0, 2) = Q(1, 1);
  
  retval = H;
end
