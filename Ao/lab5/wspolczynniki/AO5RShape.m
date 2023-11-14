function Rs = AO5RShape(im)
L = sum(sum(bwmorph(im,'remove')));
S = sum(sum(im));
Rs = L^2 / (4*pi*S);
end

