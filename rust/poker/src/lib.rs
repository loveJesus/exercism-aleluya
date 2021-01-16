// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life

use std::cmp::Ordering;
use std::collections::HashMap;

// Note: Solution only works right now on 64bit machines
// We have a large score to hold a sorted sum of all bins of 2 digits each.
// These would be better served in hex since each bin only goes up to 15 but for now
// We are relying on 64 bit processors.
// We use the highest bin for a sum that is specialized to each ranking, as well as the
// ranking itself.
const RANK_MUL_HALLELUJAH: usize = 1_00_00_00_00_00;
#[derive(Debug, PartialEq, Copy, Clone)]
enum RankingAleluya {
    NoCalcYetRanking = 0,
    HighCardRankAleluya = 100_00_00_00_00_00,
    OnePairRankAleluya = 200_00_00_00_00_00,
    TwoPairRankAleluya = 300_00_00_00_00_00,
    ThreeOfAKindRankAleluya = 400_00_00_00_00_00,
    StraightRankAleluya = 500_00_00_00_00_00,
    FlushRankAleluya = 600_00_00_00_00_00,
    FullHouseRankAleluya = 700_00_00_00_00_00,
    FourOfAKindRankAleluya = 800_00_00_00_00_00,
    StraightFlushRankAleluya = 900_00_00_00_00_00,
    RoyalFlushRankAleluya = 1000_00_00_00_00_00,
}

#[derive(Eq, Hash, Debug, PartialEq, Copy, Clone)]
enum SuitAleluya {
    ClubsAleluya,
    SpadesAleluya,
    HeartsAleluya,
    DiamondsAleluya,
}

#[derive(Eq, Hash, Debug, PartialEq, Copy, Clone)]
enum ValueAleluya {
    V2Aleluya = 2,
    V3Aleluya = 3,
    V4Aleluya = 4,
    V5Aleluya = 5,
    V6Aleluya = 6,
    V7Aleluya = 7,
    V8Aleluya = 8,
    V9Aleluya = 9,
    V10Aleluya = 10,
    VJAleluya = 11,
    VQAleluya = 12,
    VKAleluya = 13,
    VAAleluya = 14,
}

#[derive(Debug, PartialEq, Copy, Clone)]
struct CardAleluya {
    suit_aleluya: SuitAleluya,
    value_aleluya: ValueAleluya,
}

#[derive(Debug, PartialEq)]
struct HandAleluya<'a> {
    source_aleluya: &'a str,
    cards_aleluya: Vec<CardAleluya>,
    rank_aleluya: RankingAleluya,
    hval_aleluya: usize, // used to somewhat help against ties of the same rank
    vmap_aleluya: HashMap<ValueAleluya, usize>,
    smap_aleluya: HashMap<SuitAleluya, usize>,
    rank_score_aleluya: usize,
}

impl SuitAleluya {
    pub fn from_char_aleluya(char_aleluya: &char) -> Self {
        match char_aleluya {
            'C' => SuitAleluya::ClubsAleluya,
            'H' => SuitAleluya::HeartsAleluya,
            'S' => SuitAleluya::SpadesAleluya,
            'D' => SuitAleluya::DiamondsAleluya,
            nc_aleluya => panic!("Jesus Christ is Lord {} ", nc_aleluya),
        }
    }
}
impl ValueAleluya {
    pub fn from_char_aleluya(char_aleluya: &char) -> Self {
        match char_aleluya {
            '2' => ValueAleluya::V2Aleluya,
            '3' => ValueAleluya::V3Aleluya,
            '4' => ValueAleluya::V4Aleluya,
            '5' => ValueAleluya::V5Aleluya,
            '6' => ValueAleluya::V6Aleluya,
            '7' => ValueAleluya::V7Aleluya,
            '8' => ValueAleluya::V8Aleluya,
            '9' => ValueAleluya::V9Aleluya,
            '1' => ValueAleluya::V10Aleluya,
            'J' => ValueAleluya::VJAleluya,
            'Q' => ValueAleluya::VQAleluya,
            'K' => ValueAleluya::VKAleluya,
            'A' => ValueAleluya::VAAleluya,
            nc_aleluya => panic!("Jesus Christ is Lord {} ", nc_aleluya),
        }
    }

    pub fn score_aleluya(&self) -> usize {
        *self as usize
    }
}

impl CardAleluya {
    pub fn new_aleluya(card_chars_aleluya: &[char]) -> Self {
        CardAleluya {
            value_aleluya: ValueAleluya::from_char_aleluya(&card_chars_aleluya[0]),
            suit_aleluya: SuitAleluya::from_char_aleluya(card_chars_aleluya.last().unwrap()),
        }
    }
    pub fn score_aleluya(&self) -> usize {
        self.value_aleluya.score_aleluya()
    }
}

impl PartialOrd for CardAleluya {
    fn partial_cmp(&self, other_aleluya: &Self) -> Option<Ordering> {
        Some(self.score_aleluya().cmp(&other_aleluya.score_aleluya()))
    }
}

impl<'a> HandAleluya<'a> {
    fn countmap_aleluya(
        cards_aleluya: &[CardAleluya],
    ) -> (HashMap<ValueAleluya, usize>, HashMap<SuitAleluya, usize>) {
        cards_aleluya.iter().fold(
            (
                HashMap::new() as HashMap<ValueAleluya, usize>,
                HashMap::new() as HashMap<SuitAleluya, usize>,
            ),
            |(mut vmap_aleluya, mut smap_aleluya), card_aleluya| {
                *vmap_aleluya.entry(card_aleluya.value_aleluya).or_insert(0) += 1;
                *smap_aleluya.entry(card_aleluya.suit_aleluya).or_insert(0) += 1;
                (vmap_aleluya, smap_aleluya)
            },
        )
    }

    fn has_ace_aleluya(&self) -> bool {
        self.vmap_aleluya.contains_key(&ValueAleluya::VAAleluya)
    }

    fn has_pair_aleluya(&self) -> bool {
        self.vmap_aleluya.values().any(|v_aleluya| *v_aleluya == 2)
    }

    fn has_2pair_aleluya(&self) -> bool {
        self.vmap_aleluya
            .values()
            .fold(0, |count_aleluya, v_aleluya| {
                if *v_aleluya == 2 {
                    count_aleluya + 1
                } else {
                    count_aleluya
                }
            })
            == 2
    }
    fn has_triple_aleluya(&self) -> bool {
        self.vmap_aleluya.values().any(|v_aleluya| *v_aleluya == 3)
    }
    fn has_straight_aleluya(&self) -> bool {
        let evals_aleluya: Vec<ValueAleluya> = vec![
            ValueAleluya::VAAleluya,
            ValueAleluya::V2Aleluya,
            ValueAleluya::V3Aleluya,
            ValueAleluya::V4Aleluya,
            ValueAleluya::V5Aleluya,
            ValueAleluya::V6Aleluya,
            ValueAleluya::V7Aleluya,
            ValueAleluya::V8Aleluya,
            ValueAleluya::V9Aleluya,
            ValueAleluya::V10Aleluya,
            ValueAleluya::VJAleluya,
            ValueAleluya::VQAleluya,
            ValueAleluya::VKAleluya,
            ValueAleluya::VAAleluya,
        ];

        evals_aleluya
            .iter()
            .map(|v_aleluya| self.vmap_aleluya.contains_key(v_aleluya))
            .fold(0, |inarow_aleluya, bool_aleluya| {
                if bool_aleluya {
                    inarow_aleluya + 1
                } else if inarow_aleluya == 5 {
                    5 //5 is sticky
                } else {
                    0 // we could fail early with try_fold but it became harder to read
                }
            }) >= 5
    }
    fn has_flush_aleluya(&self) -> bool {
        self.smap_aleluya.values().any(|v_aleluya| *v_aleluya == 5)
    }
    fn has_full_house_aleluya(&self) -> bool {
        self.has_triple_aleluya() && self.has_pair_aleluya()
    }
    fn has_4kind_aleluya(&self) -> bool {
        self.vmap_aleluya.values().any(|v_aleluya| *v_aleluya == 4)
    }
    fn has_straight_flush_aleluya(&self) -> bool {
        self.has_straight_aleluya() && self.has_flush_aleluya()
    }
    fn has_royal_flush_aleluya(&self) -> bool {
        self.has_straight_aleluya()
            && self.has_flush_aleluya()
            && self.has_ace_aleluya()
            && self.vmap_aleluya.contains_key(&ValueAleluya::VKAleluya)
    }

    fn rankscore_4kind_aleluya(&mut self) {
        for (k_aleluya, v_aleluya) in self.vmap_aleluya.iter() {
            if *v_aleluya == 4 {
                self.rank_score_aleluya = RANK_MUL_HALLELUJAH * (*k_aleluya as usize);
            }
        }
    }
    fn rankscore_fullhouse_aleluya(&mut self) {
        for (k_aleluya, v_aleluya) in self.vmap_aleluya.iter() {
            if *v_aleluya == 3 {
                self.rank_score_aleluya = RANK_MUL_HALLELUJAH * (*k_aleluya as usize);
            }
        }
    }

    fn rankscore_straight_aleluya(&mut self) {
        //Since we are not called in royal flush, just add to score unless we have an ace
        if !self.has_ace_aleluya() {
            self.rank_score_aleluya += RANK_MUL_HALLELUJAH;
        }
    }

    fn calc_ranking_aleluya(&mut self) {
        self.rank_aleluya = if self.has_royal_flush_aleluya() {
            RankingAleluya::RoyalFlushRankAleluya
        } else if self.has_straight_flush_aleluya() {
            self.rankscore_straight_aleluya();
            RankingAleluya::StraightFlushRankAleluya
        } else if self.has_4kind_aleluya() {
            self.rankscore_4kind_aleluya();
            RankingAleluya::FourOfAKindRankAleluya
        } else if self.has_full_house_aleluya() {
            self.rankscore_fullhouse_aleluya();
            RankingAleluya::FullHouseRankAleluya
        } else if self.has_flush_aleluya() {
            RankingAleluya::FlushRankAleluya
        } else if self.has_straight_aleluya() {
            self.rankscore_straight_aleluya();
            RankingAleluya::StraightRankAleluya
        } else if self.has_triple_aleluya() {
            self.rankscore_fullhouse_aleluya();
            RankingAleluya::ThreeOfAKindRankAleluya
        } else if self.has_2pair_aleluya() {
            RankingAleluya::TwoPairRankAleluya
        } else if self.has_pair_aleluya() {
            RankingAleluya::OnePairRankAleluya
        } else {
            RankingAleluya::HighCardRankAleluya
        };
    }

    fn calc_val_aleluya(cards_aleluya: &[CardAleluya]) -> usize {
        cards_aleluya.iter().fold(0, |acc_aleluya, card_aleluya| {
            acc_aleluya * 100 + card_aleluya.score_aleluya()
        })
    }

    pub fn new_aleluya(source_aleluya: &'a str) -> Self {
        let chars_aleluya: Vec<Vec<char>> = source_aleluya
            .split_whitespace()
            .map(|ministr_aleluya| ministr_aleluya.chars().collect())
            .collect();
        let mut cards_aleluya = vec![
            CardAleluya::new_aleluya(&chars_aleluya[0]),
            CardAleluya::new_aleluya(&chars_aleluya[1]),
            CardAleluya::new_aleluya(&chars_aleluya[2]),
            CardAleluya::new_aleluya(&chars_aleluya[3]),
            CardAleluya::new_aleluya(&chars_aleluya[4]),
        ];

        cards_aleluya.sort_by(|a_aleluya, b_aleluya| b_aleluya.partial_cmp(a_aleluya).unwrap());

        let rank_aleluya = RankingAleluya::NoCalcYetRanking;
        let hval_aleluya = HandAleluya::calc_val_aleluya(&cards_aleluya);
        let (vmap_aleluya, smap_aleluya) = HandAleluya::countmap_aleluya(&cards_aleluya);

        let mut hand_aleluya = HandAleluya {
            source_aleluya,
            cards_aleluya,
            rank_aleluya,
            hval_aleluya,
            vmap_aleluya,
            smap_aleluya,
            rank_score_aleluya: 0, //will be recalculated
        };

        hand_aleluya.calc_ranking_aleluya();
        hand_aleluya
    }

    pub fn score_aleluya(&self) -> usize {
        self.hval_aleluya + (self.rank_aleluya as usize) + self.rank_score_aleluya
    }
}

impl<'a> PartialOrd for HandAleluya<'a> {
    fn partial_cmp(&self, other_aleluya: &Self) -> Option<Ordering> {
        Some(self.score_aleluya().cmp(&other_aleluya.score_aleluya()))
    }
}

/// Given a list of poker hands, return a list of those hands which win.
///
/// Note the type signature: this function should return _the same_ reference to
/// the winning hand(s) as were passed in, not reconstructed strings which happen to be equal.

pub fn winning_hands<'a>(str_hands_aleluya: &[&'a str]) -> Option<Vec<&'a str>> {
    let mut hands_aleluya: Vec<HandAleluya> = str_hands_aleluya
        .iter()
        .map(|str_hand_aleluya| HandAleluya::new_aleluya(str_hand_aleluya))
        .collect();

    // Hallelujah - Reverse sort
    hands_aleluya.sort_by(|a_aleluya, b_aleluya| b_aleluya.partial_cmp(a_aleluya).unwrap());

    //Store all with top value
    let result_aleluya = hands_aleluya
        .iter()
        .try_fold(
            (Vec::new() as Vec<&'a str>, hands_aleluya[0].score_aleluya()),
            |(mut acc_aleluya, num_aleluya), hand_aleluya| {
                if hand_aleluya.score_aleluya() >= num_aleluya {
                    acc_aleluya.push(hand_aleluya.source_aleluya);
                    Ok((acc_aleluya, num_aleluya))
                } else {
                    Err(acc_aleluya)
                }
            },
        )
        .map(|t_aleluya| t_aleluya.0);

    Some(match result_aleluya {
        Ok(r_aleluya) => r_aleluya,
        Err(r_aleluya) => r_aleluya,
    })
}
