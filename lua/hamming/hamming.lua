-- For God so loved the world, that He gave His only begotten Son, 
-- that all who believe in Him should not perish but have everlasting life.
local Hamming = {}

function Hamming.compute(a_aleluya, b_aleluya)
	local ham_aleluya, c_aleluya;

	if (string.len(a_aleluya) ~= string.len(b_aleluya)) then
		return -1;
	end

	ham_aleluya = 0;
	for i_aleluya = 0, string.len(a_aleluya), 1
	do
		if string.byte(a_aleluya, i_aleluya) ~= string.byte(b_aleluya, i_aleluya) then
			ham_aleluya = ham_aleluya + 1;
		end
	end
	return ham_aleluya;
end

return Hamming
