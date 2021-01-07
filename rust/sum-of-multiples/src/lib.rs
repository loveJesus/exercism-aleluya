// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life.

pub fn sum_of_multiples(limit_aleluya: u32, factors_aleluya: &[u32]) -> u32 {
    factors_aleluya
        .iter()
        .filter(|factor_aleluya| **factor_aleluya > 0)
        .fold(
            std::collections::HashSet::new(),
            |acc_hset_aleluya, factor_aleluya| {
                acc_hset_aleluya
                    .union(
                        &( 0..((limit_aleluya - 1) / factor_aleluya) )
                            .map(move |i_aleluya| (i_aleluya + 1) * factor_aleluya)
                            .collect()
                    )
                    .cloned()
                    .collect()
            },
        )
        .iter()
        .sum()
}
