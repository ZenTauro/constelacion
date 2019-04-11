function [f,v] = superpos(points)
  x = y = z = linspace (-5, 5, 50)';
  [xx , yy] = meshgrid(x, y);

  r = 1 ./ ((xx - points{1}.x) .^2 + (yy - points{1}.y ) .^2) + eps;
  r -= 1 ./ ((xx - points{1}.x) .^2 + (yy - points{1}.y ) .^2) + eps;
  for i = 1:length(points)
    r += 1 ./ ((xx - points{i}.x) .^2 + (yy - points{i}.y ) .^2) + eps;
  endfor
  f = figure;
  mesh(xx, yy, r)
  pbaspect([1; 1; 1])
  axis ([-2,2,-2,2])
  print -dtikz "mesh.tikz"

  vx = -2 * (xx - points{1}.x) ./ ((xx - points{1}.x) .^2 + (yy - points{1}.y ) .^2) + eps;
  vx -= -2 * (xx - points{1}.x) ./ ((xx - points{1}.x) .^2 + (yy - points{1}.y ) .^2) + eps;
  vy = -2 * (yy - points{1}.y) ./ ((xx - points{1}.x) .^2 + (yy - points{1}.y ) .^2) + eps;
  vy -= -2 * (yy - points{1}.y) ./ ((xx - points{1}.x) .^2 + (yy - points{1}.y ) .^2) + eps;
  for i = 1:length(points)
    vx += -2 * (xx - points{i}.x) ./ ((xx - points{i}.x) .^2 + (yy - points{i}.y ) .^2) + eps;
    vy += -2 * (yy - points{i}.y) ./ ((xx - points{i}.x) .^2 + (yy - points{i}.y ) .^2) + eps;
  endfor
  v = figure;
  quiver(xx, yy, vx, vy)
  pbaspect([1, 1])
  axis ([-2,2,-2,2])
  print -dtikz "vec.tikz"
endfunction
