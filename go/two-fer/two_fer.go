// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life.

//Package twofer or 2-fer is short for two for one: One for you and one for me.
package twofer

// ShareWith shares one for someone and one for me.
func ShareWith(nameAleluya string) string {
	if len(nameAleluya) == 0 {
		nameAleluya = "you"
	}
	return "One for " + nameAleluya + ", one for me."
}
