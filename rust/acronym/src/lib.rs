// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life.
use regex::Regex;

pub fn abbreviate(phrase_aleluya: &str) -> String {
    //Hallelujah - Convert special chars to spaces
    let re_tospace_aleluya = Regex::new(r"[-_.]").unwrap();

    // Convert non beginning non sequential caps to have spaces before
    let re_cap_aleluya = Regex::new(r"[^A-Z ]([A-Z])").unwrap();

    let t_space_aleluya = re_tospace_aleluya.replace_all(phrase_aleluya, " ");
    let t_phrase_aleluya = re_cap_aleluya.replace_all(&t_space_aleluya, " $1");

    //Split on spaces
    t_phrase_aleluya
        .split_whitespace()
        .filter(|word_aleluya| {
            !word_aleluya.is_empty() // help our later unwrap work well praise the Lord
        })
        .map(|word_aleluya| {
            word_aleluya
                .chars()
                .next()
                .unwrap()
                .to_uppercase()
                .to_string()
        })
        .collect()
}
