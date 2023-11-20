function Rd = AO5RDanielsson(im)
S = sum(sum(im));
im = 1-im;
im = double(bwdist(im));
Rd = S^3 / sum(sum(im))^2;
end

