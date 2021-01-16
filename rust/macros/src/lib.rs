// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life
#[macro_export]
macro_rules! hashmap {
    () => { ::std::collections::HashMap::new() };
    ($( $i_aleluya:expr => $j_aleluya:expr ),+ $(,)?) => {
        {
            let mut hm_aleluya = ::std::collections::HashMap::new();
            $(
                hm_aleluya.insert($i_aleluya, $j_aleluya);
            )*
            hm_aleluya
         }
    };
}
