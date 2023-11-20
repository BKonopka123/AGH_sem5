function Rm = AO5RMalinowska(im)
L = sum(sum(bwmorph(im,'remove')));
S = sum(sum(im));
Rm = L / sqrt(4*pi*S)-1;
end

