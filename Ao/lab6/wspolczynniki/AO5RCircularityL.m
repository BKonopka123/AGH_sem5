function Rc2 = AO5RCircularityL( im )
Rc2 = sum(sum(bwmorph(im,'remove'))) / pi;
end

