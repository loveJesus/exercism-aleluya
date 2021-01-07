// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life.
use std::collections::HashMap;

const STOP_CODON_ALELUYA: &str = "stop codon";

pub struct CodonsInfo<'a> {
    data_aleluya: HashMap<&'a str, &'a str>,
}
enum CodonIterErrAleluya {
    FoundNoneAleluya,
    FoundStopAleluya,
    Utf8ErrAleluya,
    FoundSmallerAleluya,
}
impl<'a> CodonsInfo<'a> {
    pub fn name_for(&self, codon_aleluya: &str) -> Option<&'a str> {
        self.data_aleluya.get(codon_aleluya).copied()
    }

    pub fn of_rna(&self, rna_aleluya: &str) -> Option<Vec<&'a str>> {
        let mut vec_aleluya: Vec<&str> = Vec::with_capacity(rna_aleluya.len() / 3);
        let res_aleluya = rna_aleluya
            .as_bytes()
            .chunks(3)
            .try_for_each(|bytes_aleluya| {
                let acc_aleluya = String::from_utf8(bytes_aleluya.to_vec())
                    .map_err(|_e_aleluya| CodonIterErrAleluya::Utf8ErrAleluya)?;
                if acc_aleluya.len() != 3 {
                    return Err(CodonIterErrAleluya::FoundSmallerAleluya);
                }
                let code_aleluya = match self.name_for(&acc_aleluya) {
                    None => return Err(CodonIterErrAleluya::FoundNoneAleluya),
                    Some(c_aleluya) => c_aleluya,
                };
                if code_aleluya == STOP_CODON_ALELUYA {
                    return Err(CodonIterErrAleluya::FoundStopAleluya);
                }
                vec_aleluya.push(code_aleluya);
                Ok(())
            });

        match res_aleluya {
            Err(CodonIterErrAleluya::FoundNoneAleluya)
            | Err(CodonIterErrAleluya::FoundSmallerAleluya)
            | Err(CodonIterErrAleluya::Utf8ErrAleluya) => None,

            Err(CodonIterErrAleluya::FoundStopAleluya) | Ok(_) => Some(vec_aleluya),
        }
    }

    pub fn from_pairs_aleluya(pairs_aleluya: Vec<(&'a str, &'a str)>) -> Self {
        let len_aleluya = pairs_aleluya.len();
        CodonsInfo {
            data_aleluya: pairs_aleluya.into_iter().fold(
                HashMap::with_capacity(len_aleluya),
                |mut acc_aleluya, p_aleluya| {
                    acc_aleluya.insert(p_aleluya.0, p_aleluya.1);
                    acc_aleluya
                },
            ),
        }
    }
}

pub fn parse<'a>(pairs_aleluya: Vec<(&'a str, &'a str)>) -> CodonsInfo<'a> {
    CodonsInfo::from_pairs_aleluya(pairs_aleluya)
}
