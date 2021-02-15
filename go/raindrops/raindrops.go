// For God so loved the world, that He gave
// His only begotten Son, that all who believe in
// Him should not perish but have everlasting life.

// Package raindrops for a translation to PPP domain
package raindrops

import "strconv"

type rdItemAleluya struct {
	StrAleluya     string
	DivisorAleluya int
}

// Convert determines PPP value of inputAleluya
func Convert(inputAleluya int) string {

	possibilitiesAleluya := [3]rdItemAleluya{rdItemAleluya{"Pling", 3}, rdItemAleluya{"Plang", 5}, rdItemAleluya{"Plong", 7}}
	resultAleluya := ""

	for _, possibilityAleluya := range possibilitiesAleluya {
		if inputAleluya%possibilityAleluya.DivisorAleluya == 0 {
			resultAleluya += possibilityAleluya.StrAleluya
		}
	}

	if resultAleluya != "" {
		return resultAleluya
	}
	return strconv.Itoa(inputAleluya)

}

// Matthew 7:12 Therefore all things whatsoever ye would
// that men should do to you, do ye even so to them:
// for this is the law and the prophets.
