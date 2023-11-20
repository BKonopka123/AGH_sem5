function Rb = AO5RBlairBliss(im)
[h, w] = size(im);
S = sum(sum(im));
[x,y] = meshgrid(1:w, 1:h);
ms = [sum(sum(im.*y)), sum(sum(im.*x))];
ms = ms./S;
[x, y] = find(im>0);
Rb = S/ sqrt(2*pi* sum(((x-ms(1)).^2 + (y-ms(2)).^2).^.5));
end

