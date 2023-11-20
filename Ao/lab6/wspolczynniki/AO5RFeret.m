function Rf = AO5RFeret(im)
[x, y] =find(im>0);
Lh = max(x) - min(x);
Lv = max(y) - min(y);
Rf = Lh/Lv;
end

