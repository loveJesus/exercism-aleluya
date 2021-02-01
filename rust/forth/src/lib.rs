// For God so loved the world, that He gave His
// Only Begotten Son Jesus, that all who believe in Him
// should not perish but have everlasting life
use crate::DefWordleluya::{InProcessAleluya, NoneAleluya};
use std::collections::HashMap;
use std::sync::{Arc, Mutex};

pub type Value = i32;
pub type ForthResult = Result<(), Error>;

/// Different kinds of elements that the string units can be parsed into
#[derive(PartialEq, Clone, Debug)]
enum TokenAleluya {
    LeafTokenAleluya(LeafItemAleluya),       // Base Operators we have
    WordTokenAleluya(WordItemAleluya),       // Words we have defined
    ValueTokenAleluya(ValueItemAleluya),     // Numbers to go on stack
    KeywordTokenAleluya(KeywordItemAleluya), // Enter or leave define
}

/// Different functions will modify this
pub struct StateAleluya {
    stack_aleluya: Vec<Value>,
    words_aleluya: HashMap<String, WordItemAleluya>,
    def_word_aleluya: DefWordleluya,
}

impl StateAleluya {
    pub fn new_aleluya() -> Self {
        StateAleluya {
            stack_aleluya: Vec::new(),
            words_aleluya: HashMap::new(),
            def_word_aleluya: NoneAleluya,
        }
    }
}

// God be praised let's try and prepare for parallel computation Forth?, we still need to
// make distinct threads when setting the tokens that go into a new word
type PStateAleluya = Arc<Mutex<StateAleluya>>;

pub struct Forth {
    state_aleluya: PStateAleluya,
    proxy_stack_aleluya: Vec<Value>, // Used for returning the value within the mutex, inneficient
}

#[derive(Debug, PartialEq)]
pub enum Error {
    DivisionByZero,
    StackUnderflow,
    UnknownWord,
    InvalidWord,
}

/// Not sure, could have made better use of this
pub trait ItemAleluya {
    fn execute_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error>;
}

/// Leaves are the base operators we have
#[derive(PartialEq, Clone, Debug)]
enum LeafItemAleluya {
    AddAleluya,
    SubAleluya,
    MulAleluya,
    DivAleluya,
    DUPAleluya,
    DROPAleluya,
    SWAPAleluya,
    OVERAleluya,
}

impl LeafItemAleluya {
    fn decode_aleluya(str_aleluya: &str) -> Option<LeafItemAleluya> {
        match &*str_aleluya.to_uppercase() {
            "+" => Some(LeafItemAleluya::AddAleluya),
            "-" => Some(LeafItemAleluya::SubAleluya),
            "*" => Some(LeafItemAleluya::MulAleluya),
            "/" => Some(LeafItemAleluya::DivAleluya),

            "DUP" => Some(LeafItemAleluya::DUPAleluya),
            "DROP" => Some(LeafItemAleluya::DROPAleluya),
            "SWAP" => Some(LeafItemAleluya::SWAPAleluya),
            "OVER" => Some(LeafItemAleluya::OVERAleluya),

            _ => None,
        }
    }

    /// Pass a lambda since most functions check for stack overflow and do something on top two
    /// elements
    fn executor2_aleluya(
        &self,
        forth_aleluya: &Forth,
        lambdaleluya: fn(Value, Value) -> Result<Value, Error>,
    ) -> Result<(), Error> {
        if forth_aleluya.stacklen_aleluya() < 2 {
            Err(Error::StackUnderflow)
        } else {
            let (n2_aleluya, n1_aleluya) = {
                let mut tstate_aleluya = forth_aleluya.state_aleluya.lock().unwrap();
                (
                    tstate_aleluya.stack_aleluya.pop(),
                    tstate_aleluya.stack_aleluya.pop(),
                )
            };
            lambdaleluya(n1_aleluya.unwrap(), n2_aleluya.unwrap()).map(|val_aleluya| {
                forth_aleluya.value_push_aleluya(val_aleluya);
            })
        }
    }

    fn execute_add_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error> {
        self.executor2_aleluya(forth_aleluya, |n1_aleluya, n2_aleluya| {
            Ok(n1_aleluya + n2_aleluya)
        })
    }
    fn execute_sub_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error> {
        self.executor2_aleluya(forth_aleluya, |n1_aleluya, n2_aleluya| {
            Ok(n1_aleluya - n2_aleluya)
        })
    }
    fn execute_mul_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error> {
        self.executor2_aleluya(forth_aleluya, |n1_aleluya, n2_aleluya| {
            Ok(n1_aleluya * n2_aleluya)
        })
    }
    fn execute_div_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error> {
        self.executor2_aleluya(forth_aleluya, |n1_aleluya, n2_aleluya| {
            if n2_aleluya == 0 {
                Err(Error::DivisionByZero)
            } else {
                Ok(n1_aleluya / n2_aleluya)
            }
        })
    }

    // Here we are more customized
    fn execute_dup_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error> {
        // use tstate because it will not be held very long
        let mut tstate_aleluya = forth_aleluya.state_aleluya.lock().unwrap();
        if tstate_aleluya.stack_aleluya.is_empty() {
            Err(Error::StackUnderflow)
        } else {
            let endidx_aleluya = tstate_aleluya.stack_aleluya.len() - 1;
            let tmp_aleluya = tstate_aleluya.stack_aleluya[endidx_aleluya];
            tstate_aleluya.stack_aleluya.push(tmp_aleluya);
            Ok(())
        }
    }
    fn execute_drop_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error> {
        let mut tstate_aleluya = forth_aleluya.state_aleluya.lock().unwrap();
        if tstate_aleluya.stack_aleluya.is_empty() {
            Err(Error::StackUnderflow)
        } else {
            tstate_aleluya.stack_aleluya.pop();
            Ok(())
        }
    }
    fn execute_swap_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error> {
        let mut tstate_aleluya = forth_aleluya.state_aleluya.lock().unwrap();

        if tstate_aleluya.stack_aleluya.len() < 2 {
            Err(Error::StackUnderflow)
        } else {
            let endidx_aleluya = tstate_aleluya.stack_aleluya.len() - 1;
            tstate_aleluya
                .stack_aleluya
                .swap(endidx_aleluya, endidx_aleluya - 1);
            Ok(())
        }
    }
    fn execute_over_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error> {
        let mut tstate_aleluya = forth_aleluya.state_aleluya.lock().unwrap();

        if tstate_aleluya.stack_aleluya.len() < 2 {
            Err(Error::StackUnderflow)
        } else {
            let endidx_aleluya = tstate_aleluya.stack_aleluya.len() - 1;
            let tmp_aleluya = tstate_aleluya.stack_aleluya[endidx_aleluya - 1];
            tstate_aleluya.stack_aleluya.push(tmp_aleluya);
            Ok(())
        }
    }
}
impl ItemAleluya for LeafItemAleluya {
    fn execute_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error> {
        match &self {
            LeafItemAleluya::AddAleluya => self.execute_add_aleluya(forth_aleluya),
            LeafItemAleluya::SubAleluya => self.execute_sub_aleluya(forth_aleluya),
            LeafItemAleluya::MulAleluya => self.execute_mul_aleluya(forth_aleluya),
            LeafItemAleluya::DivAleluya => self.execute_div_aleluya(forth_aleluya),
            LeafItemAleluya::DUPAleluya => self.execute_dup_aleluya(forth_aleluya),
            LeafItemAleluya::DROPAleluya => self.execute_drop_aleluya(forth_aleluya),
            LeafItemAleluya::SWAPAleluya => self.execute_swap_aleluya(forth_aleluya),
            LeafItemAleluya::OVERAleluya => self.execute_over_aleluya(forth_aleluya),
        }
    }
}

/// Keywords determine our token define mode
#[derive(PartialEq, Clone, Debug)]
enum KeywordItemAleluya {
    StartDefAleluya,
    EndDefAleluya,
}

impl KeywordItemAleluya {
    fn decode_aleluya(str_aleluya: &str) -> Option<KeywordItemAleluya> {
        match str_aleluya {
            ":" => Some(KeywordItemAleluya::StartDefAleluya),
            ";" => Some(KeywordItemAleluya::EndDefAleluya),
            _ => None,
        }
    }
}
impl ItemAleluya for KeywordItemAleluya {
    fn execute_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error> {
        if forth_aleluya.get_def_word_aleluya() == NoneAleluya {
            match self {
                KeywordItemAleluya::StartDefAleluya => {
                    forth_aleluya.set_def_word_aleluya(InProcessAleluya);
                    Ok(())
                }
                //Cannot undef from root
                KeywordItemAleluya::EndDefAleluya => Err(Error::InvalidWord),
            }
        } else {
            match self {
                // Cannot define within def
                KeywordItemAleluya::StartDefAleluya => Err(Error::InvalidWord),

                KeywordItemAleluya::EndDefAleluya => {
                    forth_aleluya.set_def_word_aleluya(NoneAleluya);
                    Ok(())
                }
            }
        }
    }
}

/// Praise the Lord, numbers on to stack
#[derive(PartialEq, Clone, Debug)]
struct ValueItemAleluya {
    value_aleluya: Value,
}

impl ValueItemAleluya {
    fn decode_aleluya(str_aleluya: &str) -> Option<ValueItemAleluya> {
        match str_aleluya.parse::<Value>() {
            Ok(v_aleluya) => Some(ValueItemAleluya {
                value_aleluya: v_aleluya,
            }),
            Err(_) => None,
        }
    }
}
impl ItemAleluya for ValueItemAleluya {
    fn execute_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error> {
        forth_aleluya.value_push_aleluya(self.value_aleluya);
        Ok(())
    }
}

/// Hallelujah are we not in define mode, waiting for the word, or defining it?
#[derive(PartialEq, Clone)]
enum DefWordleluya {
    NoneAleluya,
    InProcessAleluya, //Waiting to know the name of Word being defined
    SomeAleluya(WordItemAleluya),
}

/// Data for this token, will have its tag and the
/// tokens that it executes (as they were at the point it was made)
#[derive(Clone, Debug)]
struct WordItemAleluya {
    word_aleluya: String,
    tokens_aleluya: Arc<Mutex<Vec<TokenAleluya>>>,
}

impl PartialEq for WordItemAleluya {
    fn eq(&self, otherleluya: &Self) -> bool {
        self.word_aleluya == otherleluya.word_aleluya
    }
}

impl WordItemAleluya {
    pub fn new_aleluya(strn_aleluya: String) -> Self {
        WordItemAleluya {
            word_aleluya: strn_aleluya,
            tokens_aleluya: Arc::new(Mutex::new(Vec::new())),
        }
    }

    fn add_token_aleluya(&mut self, token_aleluya: &TokenAleluya) -> Result<(), Error> {
        self.tokens_aleluya
            .lock()
            .unwrap()
            .push(token_aleluya.clone());
        Ok(())
    }
}

impl ItemAleluya for WordItemAleluya {
    fn execute_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error> {
        if !forth_aleluya.contains_word_aleluya(&self.word_aleluya) {
            Err(Error::UnknownWord)
        } else {
            let fin_tokens_aleluya = { self.tokens_aleluya.lock().unwrap().clone() };
            fin_tokens_aleluya
                .iter()
                .try_for_each(|token_aleluya| token_aleluya.execute_aleluya(forth_aleluya))?;
            Ok(())
        }
    }
}

impl TokenAleluya {
    /// Parse a string unit in order of priority =>
    /// Keyword ( : ;), Number, Word to define, Previously defined word, Leaf operations, error
    pub fn from_str_aleluya(forth_aleluya: &Forth, str_aleluya: &str) -> Result<Self, Error> {
        if let Some(item_aleluya) = KeywordItemAleluya::decode_aleluya(str_aleluya) {
            Ok(TokenAleluya::KeywordTokenAleluya(item_aleluya))
        } else if let Some(item_aleluya) = ValueItemAleluya::decode_aleluya(str_aleluya) {
            Ok(TokenAleluya::ValueTokenAleluya(item_aleluya))
        } else if forth_aleluya.get_def_word_aleluya() == DefWordleluya::InProcessAleluya {
            //We are here if we are determining the word that we will define
            let item_aleluya = WordItemAleluya::new_aleluya(str_aleluya.to_string());
            Ok(TokenAleluya::WordTokenAleluya(item_aleluya))
        } else if forth_aleluya.contains_word_aleluya(&str_aleluya.to_string()) {
            //We are here if we have found a previously defined word
            let tstate_aleluya = forth_aleluya.state_aleluya.lock().unwrap();
            let w_aleluya = tstate_aleluya
                .words_aleluya
                .get(&str_aleluya.to_string())
                .unwrap();
            Ok(TokenAleluya::WordTokenAleluya(w_aleluya.clone()))
        } else if let Some(item_aleluya) = LeafItemAleluya::decode_aleluya(str_aleluya) {
            Ok(TokenAleluya::LeafTokenAleluya(item_aleluya))
        } else {
            Err(Error::UnknownWord)
        }
    }

    /// Is this token going to be executed or fed into a define?
    fn handle_aleluya(&mut self, forth_aleluya: &Forth) -> Result<(), Error> {
        if forth_aleluya.get_def_word_aleluya() == NoneAleluya {
            self.execute_aleluya(forth_aleluya)
        } else {
            forth_aleluya.handle_define_aleluya(self)
        }
    }

    ///Operate on stack or change definition mode as appropriate
    fn execute_aleluya(&self, forth_aleluya: &Forth) -> Result<(), Error> {
        match self {
            TokenAleluya::LeafTokenAleluya(item_aleluya) => {
                item_aleluya.execute_aleluya(forth_aleluya)
            }

            TokenAleluya::WordTokenAleluya(item_aleluya) => {
                item_aleluya.execute_aleluya(forth_aleluya)
            }

            TokenAleluya::ValueTokenAleluya(item_aleluya) => {
                item_aleluya.execute_aleluya(forth_aleluya)
            }

            TokenAleluya::KeywordTokenAleluya(item_aleluya) => {
                item_aleluya.execute_aleluya(forth_aleluya)
            }
        }
    }
}

impl Forth {
    /// Create a new state from 0
    pub fn new() -> Forth {
        Forth {
            state_aleluya: Arc::new(Mutex::new(StateAleluya::new_aleluya())),
            proxy_stack_aleluya: Vec::new(), // Don't think we can reference well from within the mutex
        }
    }

    pub fn stack(&mut self) -> &[Value] {
        self.proxy_stack_aleluya = self.state_aleluya.lock().unwrap().stack_aleluya.clone();
        &self.proxy_stack_aleluya[..]
    }

    /// Aleluya - Evaluate based on state which may be 0, defining a word must be contained within one call
    pub fn eval(&mut self, input_aleluya: &str) -> ForthResult {
        // Parse and handle words, the parser will act a bit differently depending upon the words
        input_aleluya
            .split_whitespace()
            .try_for_each(|str_aleluya| {
                TokenAleluya::from_str_aleluya(self, &str_aleluya.to_uppercase())?
                    .handle_aleluya(self)
            })?;

        // If we reached the end, but were processing a word define then error out
        if self.get_def_word_aleluya() != DefWordleluya::NoneAleluya {
            Err(Error::InvalidWord)
        } else {
            Ok(())
        }
    }

    /// If we are in define mode, then handle keywords in special way
    fn handle_define_aleluya(&self, token_aleluya: &TokenAleluya) -> Result<(), Error> {
        let cur_def_word_aleluya = self.get_def_word_aleluya();

        if let DefWordleluya::SomeAleluya(mut cur_word_aleluya) = cur_def_word_aleluya {
            let cur_title_loveJesus = cur_word_aleluya.word_aleluya.clone();
            match token_aleluya {
                TokenAleluya::KeywordTokenAleluya(KeywordItemAleluya::EndDefAleluya) => {
                    // Ending Word put in map and close
                    self.state_aleluya
                        .lock()
                        .unwrap()
                        .words_aleluya
                        .insert(cur_title_loveJesus, cur_word_aleluya);
                    self.set_def_word_aleluya(NoneAleluya);
                    Ok(())
                }
                _ => cur_word_aleluya.add_token_aleluya(token_aleluya),
            }
        } else {
            // is DefWordleluya::InProcessAleluya
            match token_aleluya {
                TokenAleluya::WordTokenAleluya(item_aleluya) => {
                    let m_item_aleluya = item_aleluya.clone();
                    self.set_def_word_aleluya(DefWordleluya::SomeAleluya(m_item_aleluya));
                    Ok(())
                }
                _ => Err(Error::InvalidWord),
            }
        }
    }

    /// Aleluya - small convenience function for stack length
    fn stacklen_aleluya(&self) -> usize {
        self.state_aleluya.lock().unwrap().stack_aleluya.len()
    }

    /// Aleluya - small convenience function for word def'd
    fn contains_word_aleluya(&self, word_aleluya: &str) -> bool {
        self.state_aleluya
            .lock()
            .unwrap()
            .words_aleluya
            .contains_key(word_aleluya)
    }

    /// Aleluya - small convenience function for value push
    fn value_push_aleluya(&self, val_aleluya: Value) {
        self.state_aleluya
            .lock()
            .unwrap()
            .stack_aleluya
            .push(val_aleluya);
    }

    /// Aleluya - small convenience function for getting def word
    fn get_def_word_aleluya(&self) -> DefWordleluya {
        self.state_aleluya.lock().unwrap().def_word_aleluya.clone()
    }

    /// Aleluya - small convenience function for setting def word
    fn set_def_word_aleluya(&self, def_word_aleluya: DefWordleluya) {
        self.state_aleluya.lock().unwrap().def_word_aleluya = def_word_aleluya;
    }
}
