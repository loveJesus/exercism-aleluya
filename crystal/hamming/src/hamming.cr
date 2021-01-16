# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
class Hamming
	def self.distance(a_aleluya, b_aleluya)
		raise ArgumentError.new if a_aleluya.size != b_aleluya.size
		(0...a_aleluya.size).count { |i_aleluya| 
			a_aleluya[i_aleluya] != b_aleluya[i_aleluya]
		}
	end
end	
# Forgive and thou shalt be forgiven