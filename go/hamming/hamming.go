// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life.

//Package hamming for a measure of distance between two DNA strands
package hamming

import (
	"errors"
)

// Distance calculates hamming distance between two DNA strands
func Distance(aDNAleluya, bDNAleluya string) (int, error) {
	if len(aDNAleluya) != len(bDNAleluya) {
		return 0, errors.New("different string length aleluya")
	}

	sumAleluya := 0
	bRunesAleluya := []rune(bDNAleluya)
	aRunesAleluya := []rune(aDNAleluya)

	for idxAleluya, aCharAleluya := range aRunesAleluya {
		bCharAleluya := bRunesAleluya[idxAleluya]
		if bCharAleluya != aCharAleluya {
			sumAleluya++
		}
	}

	return sumAleluya, nil
}
