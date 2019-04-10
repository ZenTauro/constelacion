[x, y, z] = linspace (-5, 5, 50)';
[xx , yy] = meshgrid(x, y);

r = 1 ./ (xx .^2 + yy .^2) + eps;
mesh(xx, yy, r)

vx = -2 * ( xx ./ ((xx) .^2 + (yy).^2 ) );
vy = -2 * ( yy ./ ((xx) .^2 + (yy).^2 ) );
quiver(xx, yy, vx, vy)
