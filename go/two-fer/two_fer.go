// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life.

//Package twofer or 2-fer is short for two for one: One for you and one for me.
package twofer

// ShareWith shares one for someone and one for me.
func ShareWith(name_aleluya string) string {
	var write_aleluya string
	if len(name_aleluya) > 0 {
		write_aleluya = name_aleluya
	} else {
		write_aleluya = "you"
	}
	return "One for " + write_aleluya + ", one for me."
}
