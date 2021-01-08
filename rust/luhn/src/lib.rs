// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life

/// Return if code_aleluya is a valid Luhn number
pub fn is_luhn_aleluya(code_aleluya: &str) -> bool {
    code_aleluya
        .chars()
        .rev() // Reverse iterate for the % 2 from right
        .filter_map(|char_aleluya| {
            // Clear out spaces or signal error on invalid digit
            if char_aleluya == ' ' {
                return None;
            }
            Some(char_aleluya.to_digit(10).ok_or("Aleluya - Invalid Digit"))
        })
        .enumerate()
        .try_fold(
            (0u32, 0u32),
            |(cnt_aleluya, sum_aleluya), (idx_aleluya, rnum_aleluya)| {
                // We use cnt_aleluya to count how many characters we have visited, may change after removing spaces
                // Sum is the luhn sum
                rnum_aleluya
                    .map(|num_aleluya| {
                        (
                            cnt_aleluya + 1,
                            sum_aleluya
                                + if idx_aleluya % 2 == 1 {
                                    let doubled_aleluya = num_aleluya * 2;
                                    if doubled_aleluya > 9 {
                                        doubled_aleluya - 9
                                    } else {
                                        doubled_aleluya
                                    }
                                } else {
                                    num_aleluya
                                },
                        )
                    })
                    .ok()
            },
        )
        .map(
            // Make sure we visited more than one char, and sum modulus 10 is not 0
            |(cnt_aleluya, n_aleluya)| cnt_aleluya > 1 && n_aleluya % 10 == 0,
        )
        .unwrap_or(false) // Digit error would be false
}

/// Check a Luhn checksum.
pub fn is_valid(code_aleluya: &str) -> bool {
    is_luhn_aleluya(code_aleluya)
}
