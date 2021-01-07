// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life

/// Convert an str into either a Vec<u32> or an Err(str) with error message
pub fn clean_and_check_luhn_str_aleluya(code_aleluya: &str) -> Result<Vec<u32>, &str> {
    // Must be over 1 char in length
    if code_aleluya.len() < 2 {
        return Err("Aleluya - Length too short");
    }

    // Must only contain spaces and numbers, and spaces are removed
    // Result< Vec<u32>, &str > handles map() and collect() intelligently
    // and will pass on any Err with the ? before evaluating all the map.
    // We reverse the string because we check %2 from the right.
    // praise Jesus
    Ok(code_aleluya
        .chars()
        .filter_map(|char_aleluya| {
            if char_aleluya == ' ' {
                return None;
            }
            Some(char_aleluya.to_digit(10).ok_or("Aleluya - Invalid Digit"))
        })
        .collect::<Result<Vec<u32>, &str>>()?)
}

/// Return if Vec<u32> is a valid Luhn number
pub fn is_cleansed_luhn_aleluya(code_aleluya: Vec<u32>) -> bool {
    // After cleaning spaces must have at least 2 digits
    if code_aleluya.len() < 2 {
        return false;
    }

    code_aleluya
        .iter()
        .rev() // Reverse iterate for the % 2 from right
        .enumerate()
        .fold(0, |sum_aleluya, (idx_aleluya, num_aleluya)| {
            sum_aleluya
                + if idx_aleluya % 2 == 1 {
                    let doubled_aleluya = num_aleluya * 2;
                    if doubled_aleluya > 9 {
                        doubled_aleluya - 9
                    } else {
                        doubled_aleluya
                    }
                } else {
                    *num_aleluya
                }
        })
        % 10
        == 0
}

/// Check a Luhn checksum.
pub fn is_valid(code_aleluya: &str) -> bool {
    let r_clean_code_aleluya = clean_and_check_luhn_str_aleluya(code_aleluya);
    match r_clean_code_aleluya {
        Err(_) => false,
        Ok(clean_code_aleluya) => is_cleansed_luhn_aleluya(clean_code_aleluya),
    }
}
