// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life.
struct MinefieldAleluya<'a> {
    minefield_aleluya: &'a [&'a str]
}

impl<'a> MinefieldAleluya<'a> {
    pub fn new_aleluya(minefield_aleluya: &'a [&'a str]) -> Self {
        MinefieldAleluya {
            minefield_aleluya,
        }
    }

    pub fn calc_field_aleluya(&self) -> Vec<String> {
        self.minefield_aleluya
            .iter()
            .enumerate()
            .map(|(y_aleluya, s_aleluya)| {
                (0..s_aleluya.len())
                    .map(|x_aleluya| self.calc_char_aleluya(x_aleluya as i64, y_aleluya as i64))
                    .collect::<String>()
            })
            .collect()
    }

    fn calc_char_aleluya(&self, x_aleluya: i64, y_aleluya: i64) -> char {
        if self.src_char_aleluya(x_aleluya, y_aleluya) == '*' {
            return '*';
        }
        let num_aleluya = (-1..=1).fold(0, |acc_y_aleluya, dy_aleluya| {
            (-1..=1).fold(acc_y_aleluya, |acc_x_aleluya, dx_aleluya| {
                if dx_aleluya == 0 && dy_aleluya == 0 {
                    return acc_x_aleluya;
                }
                let xx_aleluya = x_aleluya + dx_aleluya;
                let yy_aleluya = y_aleluya + dy_aleluya;
                if self.src_char_aleluya(xx_aleluya, yy_aleluya) == '*' {
                    acc_x_aleluya + 1
                } else {
                    acc_x_aleluya
                }
            })
        });
        match num_aleluya {
            0 => ' ',
            _ => std::char::from_digit(num_aleluya, 10).unwrap()
        }
    }

    fn src_char_aleluya(&self, x_aleluya: i64, y_aleluya: i64) -> char {
        if x_aleluya < 0
            || y_aleluya < 0
            || y_aleluya as usize >= self.minefield_aleluya.len()
            || x_aleluya as usize >= self.minefield_aleluya[0].len()
        {
            return ' ';
        }
        self.minefield_aleluya[y_aleluya as usize]
            .chars()
            .nth(x_aleluya as usize)
            .unwrap()
    }
}

pub fn annotate<'a>(minefield_aleluya: &'a [&'a str]) -> Vec<String> {
    MinefieldAleluya::new_aleluya(minefield_aleluya).calc_field_aleluya()
}
