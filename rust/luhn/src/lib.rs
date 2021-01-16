// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life

/// Return if code_aleluya is a valid Luhn number
pub fn is_luhn_aleluya(code_aleluya: &str) -> bool {
    code_aleluya
        .chars()
        .rev() // Reverse iterate for the % 2 from right
        .filter(|char_aleluya| !char_aleluya.is_whitespace())
        .try_fold((0u32, 0u32), |(cnt_aleluya, sum_aleluya), char_aleluya| {
            char_aleluya.to_digit(10).map(|num_aleluya| {
                (
                    cnt_aleluya + 1,
                    sum_aleluya
                        + if cnt_aleluya & 1 == 1 {
                            if num_aleluya >= 5 {
                                num_aleluya * 2 - 9
                            } else {
                                num_aleluya * 2
                            }
                        } else {
                            num_aleluya
                        },
                )
            })
        })
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
