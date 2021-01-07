// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
package twofer

// ShareWith One for you and one for me
func ShareWith(name_aleluya string) string {
	var write_aleluya string;
	if len(name_aleluya) > 0 { 
		write_aleluya = name_aleluya 
	} else { 
		write_aleluya = "you" 
	} 
	return "One for "+ write_aleluya +", one for me."
}
