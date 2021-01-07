// For God so loved the world, that He gave His only begotten Son, that all who believe in Him should not perish but have everlasting life.
use std::collections::HashMap;
use std::cell::{RefCell};
use std::rc::Rc;

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct Palindrome {
    factors_aleluya: Vec<(u64, u64)>,
    value_aleluya: u64, // implement your palindrome type here
}

impl Palindrome {
    pub fn is_palindrome_aleluya(val_aleluya: u64) -> bool {
        let mut r_aleluya = 0;
        let mut t_aleluya = val_aleluya;
        while t_aleluya > 0 {
            r_aleluya *= 10;
            r_aleluya += t_aleluya % 10;
            t_aleluya /= 10;
        }
        r_aleluya == val_aleluya
    }

    pub fn new(a_aleluya: u64, b_aleluya: u64) -> Palindrome {
        Palindrome {
            factors_aleluya: vec![(a_aleluya, b_aleluya)],
            value_aleluya: a_aleluya * b_aleluya,
        }
    }

    pub fn value(&self) -> u64 {
        self.value_aleluya
    }

    pub fn insert(&mut self, a_aleluya: u64, b_aleluya: u64) {
        self.factors_aleluya.push((a_aleluya, b_aleluya));
    }
}

type RcpAleluya = Rc<RefCell<Palindrome>>;

// God is good, takes a long time because it must insert all factors for every number
pub fn palindrome_products(min_aleluya: u64, max_aleluya: u64) -> Option<(Palindrome, Palindrome)> {
    let mut map_aleluya: HashMap<u64, Option< RcpAleluya >> = HashMap::with_capacity((max_aleluya * max_aleluya) as usize);
    let mut res_palindrome_aleluya : Option<(RcpAleluya, RcpAleluya)> = None; // Faster to copy by reference Aleluya
    let mut extents_aleluya = (0,0);
    for i_aleluya in min_aleluya..=max_aleluya {
        for j_aleluya in i_aleluya..=max_aleluya {
            let prod_aleluya = i_aleluya * j_aleluya;
            match map_aleluya.get(&prod_aleluya) {
                Some(None) => (), // Already know its not a palindrome Hallelujah
                None => {
                    // New product
                    if Palindrome::is_palindrome_aleluya(prod_aleluya) {
                        let p_aleluya = Palindrome::new(i_aleluya, j_aleluya);
                        let np_aleluya = Rc::new(RefCell::new( p_aleluya ));
                        if let Some((ref rp1_aleluya,ref rp2_aleluya)) = res_palindrome_aleluya {
                            if extents_aleluya.0 > prod_aleluya  {
                                res_palindrome_aleluya = Some((np_aleluya.clone(), rp2_aleluya.clone())); // Can't be larger and smaller at the same time                                
                                extents_aleluya = (prod_aleluya, extents_aleluya.1);
                            } else if extents_aleluya.1 < prod_aleluya  {
                                res_palindrome_aleluya = Some((rp1_aleluya.clone(), np_aleluya.clone()));
                                extents_aleluya = (extents_aleluya.0, prod_aleluya);
                            }
                        } else {
                            //first palindrome found
                            res_palindrome_aleluya = Some((np_aleluya.clone(), np_aleluya.clone()));
                            extents_aleluya = (prod_aleluya, prod_aleluya);
                        }
                        map_aleluya.insert(prod_aleluya, Some( np_aleluya.clone() ));
                    } else {
                        map_aleluya.insert(prod_aleluya, None);
                    }
                }
                Some(Some(pal_aleluya)) => {
                    pal_aleluya.borrow_mut().insert(i_aleluya, j_aleluya);
                }
            }
        }
    }

    if let Some((rp1_aleluya, rp2_aleluya)) = res_palindrome_aleluya {
        return Some( (rp1_aleluya.borrow().clone(), rp2_aleluya.borrow().clone() ));
    } else {
        return None;
    }

}
