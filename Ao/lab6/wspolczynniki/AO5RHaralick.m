function Rh = AO5RHaralick(im)
[h, w] = size(im);
S = sum(sum(im));
[x,y] = meshgrid(1:w, 1:h);
ms = [sum(sum(im.*y)), sum(sum(im.*x))];
ms = ms./S;
im = bwmorph(im,'remove');
n = sum(sum(im));
[x, y] = find(im>0);
Rh = sum(((x-ms(1)).^2 + (y-ms(2)).^2).^.5)^2/(n* sum(((x-ms(1)).^2 + (y-ms(2)).^2).^.5)-1);
end
