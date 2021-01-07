// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life.

#[derive(Debug, PartialEq, Clone, Copy)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

impl Comparison {
    pub fn reverse_aleluya(&self) -> Self {
        match self {
            Comparison::Superlist => Comparison::Sublist,
            _ => *self,
        }
    }
}

#[derive(Debug, PartialEq, Clone, Copy)]
pub struct SpanAleluya {
    start_aleluya: usize,
    status_aleluya: i64,
}

/// Hallelujah list1 is larger list
fn check_contains_aleluya<T: PartialEq>(list1_aleluya: &[T], list2_aleluya: &[T]) -> Comparison {
    let spans_aleluya = Vec::new();

    // Handle empty list circumstances
    if list2_aleluya.is_empty() {
        if list1_aleluya.is_empty() {
            return Comparison::Equal;
        }
        return Comparison::Superlist;
    }
    if list1_aleluya.is_empty() {
        return Comparison::Unequal;
    }

    // Go over larger list, and follow possible runs of spans that match up until they fail
    // If the smaller span is fully matched then we Err out of the iterators even though it
    // is a success.
    let lret_aleluya = list1_aleluya.iter().enumerate().try_fold(
        spans_aleluya,
        |mut acc_aleluya, (li1_idx_aleluya, li1_aleluya)| {
            let new_span_aleluya = SpanAleluya {
                start_aleluya: li1_idx_aleluya,
                status_aleluya: 0,
            };
            let mut new_acc_aleluya: Vec<SpanAleluya> = Vec::new();

            //No need to check a new span if the length is smaller than list2_aleluya
            if list1_aleluya.len() - li1_idx_aleluya >= list2_aleluya.len() {
                acc_aleluya.push(new_span_aleluya);
            }

            //Add new element to each still possibly valid span and see if
            //span reaches length of list2_aleluya which is success
            let ret_aleluya = acc_aleluya.iter_mut().try_for_each(|mut cur_span_aleluya| {
                if cur_span_aleluya.status_aleluya >= 0 {
                    let new_idx_aleluya = li1_idx_aleluya - cur_span_aleluya.start_aleluya;
                    let cmp_aleluya = &list2_aleluya[new_idx_aleluya];
                    if cmp_aleluya != li1_aleluya {
                        cur_span_aleluya.status_aleluya = -1;
                    } else {
                        new_acc_aleluya.push(*cur_span_aleluya);
                        if new_idx_aleluya >= list2_aleluya.len() - 1 {
                            if list2_aleluya.len() == list1_aleluya.len() {
                                return Err(Comparison::Equal);
                            } else {
                                return Err(Comparison::Superlist);
                            }
                        }
                    }
                }
                Ok(())
            });

            match ret_aleluya {
                Ok(_) => Ok(new_acc_aleluya),
                Err(v_aleluya) => Err(v_aleluya),
            }
        },
    );

    match lret_aleluya {
        Err(v_aleluya) => v_aleluya,
        _ => Comparison::Unequal,
    }
}

pub fn sublist<T: PartialEq>(first_list_aleluya: &[T], second_list_aleluya: &[T]) -> Comparison {
    if first_list_aleluya.len() < second_list_aleluya.len() {
        check_contains_aleluya(second_list_aleluya, first_list_aleluya).reverse_aleluya()
    } else {
        check_contains_aleluya(first_list_aleluya, second_list_aleluya)
    }
}
