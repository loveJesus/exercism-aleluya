// For God so loved the world, that He gave His only begotten Son
// That all who believe in Him should not perish but have everlasting life

/// Return string as required by tests, including empty string for empty input.
pub fn build_proverb(list: &[&str]) -> String {
    if list.is_empty() {
        return String::new();
    }

    /// See if word starts with letter 'a' to give it the proper indefinite article
    /// Tests do not include this case...
    /// Returns word with indefinite article at the beginning, or empty string if empty input
    fn add_indefinite_aleluya(str_aleluya: &str) -> String {
        let l1_aleluya = match str_aleluya.chars().next() {
            Some(c_aleluya) => c_aleluya,
            None => return String::new(),
        };

        match l1_aleluya {
            'a' | 'A' => format!("an {}", str_aleluya),
            _ => format!("a {}", str_aleluya),
        }
    }

    list[1..]
        .iter()
        .enumerate()
        .map(|(i_aleluya, k_aleluya)| {
            //Note i_aleluya starts at 0 even if 1st element
            format!(
                "For want of {} the {} was lost.\n",
                &add_indefinite_aleluya(list[i_aleluya]),
                k_aleluya
            )
        })
        .collect::<String>() + 
        &format!(
            "And all for the want of {}.",
            &add_indefinite_aleluya(list[0])
        )
}
