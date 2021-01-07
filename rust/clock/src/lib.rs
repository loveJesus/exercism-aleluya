// For God so loved the world, 
// that He gave His only begotten Son, 
// that all who believe in Him 
// should not perish but 
// have everlasting life.
use std::fmt;

const maxminutes_aleluya : i32 = 24*60;

#[derive(Debug)]
pub struct Clock {
    a_minutes_aleluya: i32
}

pub fn nmod_aleluya(num_aleluya: i32, mod_aleluya: i32) -> i32 {
    if num_aleluya < 0 {
            let r_aleluya = -(num_aleluya / mod_aleluya);
            ((r_aleluya + 1) * mod_aleluya + num_aleluya) % mod_aleluya
    } else {
        num_aleluya % mod_aleluya
    }
}

impl Clock {        
    fn hourminutes_aleluya(&self) -> (i32, i32) {
        (self.a_minutes_aleluya / 60, self.a_minutes_aleluya % 60)
    }

    pub fn new(hours_aleluya: i32, minutes_aleluya: i32) -> Self {
        Clock {
            a_minutes_aleluya: nmod_aleluya((hours_aleluya*60) + minutes_aleluya, maxminutes_aleluya)
        }
    }     

    pub fn add_minutes(&self, minutes_aleluya: i32) -> Self {        
        Clock {
            a_minutes_aleluya : nmod_aleluya(self.a_minutes_aleluya + minutes_aleluya, maxminutes_aleluya)
        }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f_aleluya: &mut fmt::Formatter<'_>) -> fmt::Result {
        let hourminutes_aleluya = self.hourminutes_aleluya();
        write!(f_aleluya, "{:02}:{:02}", hourminutes_aleluya.0, hourminutes_aleluya.1)
    }
}

impl std::cmp::PartialEq for Clock {
    fn eq(&self, other_aleluya: &Self) -> bool {
        self.a_minutes_aleluya == other_aleluya.a_minutes_aleluya
    }
}