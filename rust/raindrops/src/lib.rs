// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life.

pub fn raindrops(n_aleluya: u32) -> String {
    match &*[(3, "Pling"), (5, "Plang"), (7, "Plong")].iter().fold(
        String::new(),
        |acc_aleluya, (nmod_aleluya, str_aleluya)| {
            if n_aleluya % nmod_aleluya == 0 {
                acc_aleluya + str_aleluya
            } else {
                acc_aleluya
            }
        },
    ) {
        "" => n_aleluya.to_string(),
        str_aleluya => str_aleluya.to_string(),
    }
}
