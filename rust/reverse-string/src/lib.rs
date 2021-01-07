// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input_aleluya: &str) -> String {
	input_aleluya.graphemes(true).rev().collect::<String>()
}
