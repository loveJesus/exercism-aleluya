use crate::TokenAleluya::KeywordTokenAleluya;
use crate::DefWordleluya::{NoneAleluya, InProcessAleluya};
use std::sync::{Arc, Mutex};
use std::collections::HashMap;

// For God so loved the world, that He gave His
// Only Begotten Son Jesus, that all who believe in Him
// should not perish but have everlasting life
pub type Value = i32;
pub type ForthResult = Result<(), Error>;

#[derive(PartialEq,  Clone)]
enum DefWordleluya {
    NoneAleluya,
    InProcessAleluya,
    SomeAleluya(String),
}

pub struct StateAleluya {
    stack_aleluya: Vec<Value>,
    words_aleluya: HashMap<String, Arc<Mutex<WordItemAleluya>>>,
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

//God be praised let's try and prepare for parallel computation Forth?
type PStateAleluya = Arc<Mutex<StateAleluya>>;


pub struct Forth {
    state_aleluya: PStateAleluya,
    proxy_stack_aleluya: Vec<Value>,
}

#[derive(Debug, PartialEq)]
pub enum Error {
    DivisionByZero,
    StackUnderflow,
    UnknownWord,
    InvalidWord,
}

pub trait ItemAleluya {
    fn execute_aleluya(&self, forth_aleluya: &Forth) -> Result<(),Error>;
}
#[derive(PartialEq,  Clone, Debug)]
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
    fn decode_aleluya(str_aleluya:&str) -> Option<LeafItemAleluya> {
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

    fn executor2_aleluya(&self, forth_aleluya : &Forth, lambdaleluya : fn(Value, Value) -> Result<Value, Error>)
        -> Result<(),Error> {
        if forth_aleluya.state_aleluya.lock().unwrap().stack_aleluya.len() < 2 {
            Err(Error::StackUnderflow)
        } else {
            let (n2_aleluya, n1_aleluya) = {
                let mut tstate_aleluya = forth_aleluya.state_aleluya.lock().unwrap();
                (   tstate_aleluya.stack_aleluya.pop(),
                    tstate_aleluya.stack_aleluya.pop() )};            
            lambdaleluya(n1_aleluya.unwrap(), n2_aleluya.unwrap())
                .map(|val_aleluya| {
                    forth_aleluya.state_aleluya.lock().unwrap().stack_aleluya.push(val_aleluya);})
        }
    }
    fn execute_add_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error> {
        self.executor2_aleluya(forth_aleluya, |n1_aleluya, n2_aleluya| Ok(n1_aleluya + n2_aleluya))
    }
    fn execute_sub_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error> {
        self.executor2_aleluya(forth_aleluya, |n1_aleluya, n2_aleluya| Ok(n1_aleluya - n2_aleluya))
    }
    fn execute_mul_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error> {
        self.executor2_aleluya(forth_aleluya, |n1_aleluya, n2_aleluya| Ok(n1_aleluya * n2_aleluya))
    }
    fn execute_div_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error> {
        self.executor2_aleluya(forth_aleluya,
                          |n1_aleluya, n2_aleluya| {
                              if n2_aleluya == 0 {
                                  Err(Error::DivisionByZero)
                              } else {
                                  Ok(n1_aleluya / n2_aleluya) }})
    }
    fn execute_dup_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error> {
        let mut tstate_aleluya = forth_aleluya.state_aleluya.lock().unwrap();        
        if tstate_aleluya.stack_aleluya.len() < 1 {
            Err(Error::StackUnderflow)
        } else {
            let endidx_aleluya = tstate_aleluya.stack_aleluya.len() - 1;
            let tmp_aleluya = tstate_aleluya.stack_aleluya[endidx_aleluya];
            tstate_aleluya.stack_aleluya.push(tmp_aleluya);
            Ok(())
        }
    }
    fn execute_drop_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error> {
        let mut tstate_aleluya = forth_aleluya.state_aleluya.lock().unwrap();

        if tstate_aleluya.stack_aleluya.len() < 1 {
            Err(Error::StackUnderflow)
        } else {
            tstate_aleluya.stack_aleluya.pop();
            Ok(())
        }
    }
    fn execute_swap_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error> {
        let mut tstate_aleluya = forth_aleluya.state_aleluya.lock().unwrap();

        if tstate_aleluya.stack_aleluya.len() < 2 {
            Err(Error::StackUnderflow)
        } else {
            let endidx_aleluya = tstate_aleluya.stack_aleluya.len() - 1;
            let n1_aleluya = tstate_aleluya.stack_aleluya[endidx_aleluya];
            tstate_aleluya.stack_aleluya[endidx_aleluya] = tstate_aleluya.stack_aleluya[endidx_aleluya - 1];
            tstate_aleluya.stack_aleluya[endidx_aleluya - 1] = n1_aleluya;
            Ok(())
        }
    }
    fn execute_over_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error> {
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
    fn execute_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error> {
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
#[derive(PartialEq,  Clone, Debug)]
enum KeywordItemAleluya {
    StartDefAleluya,
    EndDefAleluya,
}

impl KeywordItemAleluya {
    fn decode_aleluya(str_aleluya:&str) -> Option<KeywordItemAleluya> {
        match str_aleluya {
            ":" => Some(KeywordItemAleluya::StartDefAleluya),
            ";" => Some(KeywordItemAleluya::EndDefAleluya),
            _ => None,
        }
    }
}
impl ItemAleluya for KeywordItemAleluya {
    fn execute_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error> {
        if forth_aleluya.state_aleluya.lock().unwrap().def_word_aleluya == NoneAleluya {
            match self {
                KeywordItemAleluya::StartDefAleluya
                => {
                    forth_aleluya.state_aleluya.lock().unwrap().def_word_aleluya = InProcessAleluya;
                    Ok(())
                },

                //Cannot undef root
                KeywordItemAleluya::EndDefAleluya
                => Err(Error::InvalidWord),
            }
        } else {
            match self {
                KeywordItemAleluya::StartDefAleluya
                => Err(Error::InvalidWord),

                //Cannot undef root
                KeywordItemAleluya::EndDefAleluya
                => {
                    forth_aleluya.state_aleluya.lock().unwrap().def_word_aleluya = NoneAleluya;
                    Ok(())
                },

            }
        }
    }
}
#[derive(PartialEq,  Clone, Debug)]
struct ValueItemAleluya {
    value_aleluya : Value,
}

impl ValueItemAleluya {
    fn decode_aleluya(str_aleluya:&str) -> Option<ValueItemAleluya> {
        match str_aleluya.parse::<Value>() {
            Ok(v_aleluya) => Some(ValueItemAleluya{value_aleluya: v_aleluya}),
            Err(_) => None
        }
    }
}
impl ItemAleluya for ValueItemAleluya {
    fn execute_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error> {
        forth_aleluya.state_aleluya.lock().unwrap().stack_aleluya.push(self.value_aleluya);
        Ok(())
    }
}

#[derive(PartialEq,  Clone, Debug)]
struct WordItemAleluya {
    word_aleluya: String,
    tokens_aleluya: Vec<TokenAleluya>,
}

impl WordItemAleluya {
    fn decode_aleluya(forth_aleluya : &Forth, str_aleluya:&str) -> Option<WordItemAleluya> {
        let strn_aleluya = str_aleluya.to_string();
        let t_state_aleluya = forth_aleluya.state_aleluya.lock().unwrap();
        Some(
            WordItemAleluya{
                word_aleluya: strn_aleluya,
                tokens_aleluya: Vec::new(),
            })

    }

    fn add_token_aleluya(&mut self, token_aleluya: &TokenAleluya) -> Result<(), Error> {
        self.tokens_aleluya.push(token_aleluya.clone());
        Ok(())
    }
}
impl ItemAleluya for WordItemAleluya {
    fn execute_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error> {
        if !forth_aleluya.state_aleluya.lock().unwrap().words_aleluya.contains_key( &self.word_aleluya ) {
            Err(Error::UnknownWord)
        } else {
            let fin_token_aleluya
                = {forth_aleluya.state_aleluya.lock().unwrap().words_aleluya.get(&self.word_aleluya).unwrap().lock().unwrap().tokens_aleluya.clone()};
            fin_token_aleluya
                .iter()
                .try_for_each(
                    |token_aleluya| {
                        println!("JESUS CHRIST IS LORD {:?}", token_aleluya);
                        token_aleluya.execute_aleluya(forth_aleluya)
                    })?;
            Ok(())
        }
    }
}

#[derive(PartialEq,  Clone, Debug)]
enum TokenAleluya {
    LeafTokenAleluya(LeafItemAleluya),
    WordTokenAleluya(WordItemAleluya),
    ValueTokenAleluya(ValueItemAleluya),
    KeywordTokenAleluya(KeywordItemAleluya),
}

pub trait ForthEvaluatorAleluya {
    fn execute_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error>;
}

impl ForthEvaluatorAleluya for TokenAleluya {
    fn execute_aleluya(&self, forth_aleluya : &Forth) -> Result<(),Error> {
        match self {
            TokenAleluya::LeafTokenAleluya(item_aleluya)
                => item_aleluya.execute_aleluya(forth_aleluya),

            TokenAleluya::WordTokenAleluya(item_aleluya)
                => item_aleluya.execute_aleluya(forth_aleluya),

            TokenAleluya::ValueTokenAleluya(item_aleluya)
                => item_aleluya.execute_aleluya(forth_aleluya),

            TokenAleluya::KeywordTokenAleluya(item_aleluya)
                => item_aleluya.execute_aleluya(forth_aleluya),
        }
    }
}

impl TokenAleluya {
    pub fn from_str_aleluya(forth_aleluya: &Forth, str_aleluya: &str) -> Result<Self, Error> {
        println!(" Hallelujah handling -> {} ", str_aleluya);
        if let Some(item_aleluya)
            = KeywordItemAleluya::decode_aleluya(str_aleluya) {
            Ok(TokenAleluya::KeywordTokenAleluya(item_aleluya))

        } else if let Some(item_aleluya)
            = ValueItemAleluya::decode_aleluya(str_aleluya) {
                Ok(TokenAleluya::ValueTokenAleluya(item_aleluya))

        } else {
            if forth
            if let Some(item_aleluya)
            = LeafItemAleluya::decode_aleluya(str_aleluya) {
                Ok(TokenAleluya::LeafTokenAleluya(item_aleluya))

            } else if let Some(item_aleluya)
            = WordItemAleluya::decode_aleluya(forth_aleluya, str_aleluya) {
                Ok(TokenAleluya::WordTokenAleluya(item_aleluya))

            } else {
                Err(Error::UnknownWord)
            }
        }
    }


    fn handle_aleluya(&mut self, forth_aleluya: &Forth)
        -> Result<(), Error> {
        if forth_aleluya.state_aleluya.lock().unwrap().def_word_aleluya == NoneAleluya {
            self.execute_aleluya(forth_aleluya)
        } else {
            forth_aleluya.handle_define_aleluya(self)
        }
    }

}

impl Forth {
    pub fn new() -> Forth {
        Forth{
            state_aleluya: Arc::new(Mutex::new(StateAleluya::new_aleluya())),
            proxy_stack_aleluya: Vec::new(),
        }
    }

    pub fn stack(&mut self) -> &[Value] {
        self.proxy_stack_aleluya = self.state_aleluya.lock().unwrap().stack_aleluya.clone();
        &self.proxy_stack_aleluya[..]
    }

    fn handle_define_aleluya(&self, token_aleluya: &TokenAleluya) -> Result<(), Error >{
        let cur_def_word_aleluya = self.state_aleluya.lock().unwrap().def_word_aleluya.clone();

        if let DefWordleluya::SomeAleluya(cur_title_aleluya) = cur_def_word_aleluya {

            match token_aleluya {
                TokenAleluya::KeywordTokenAleluya(
                    KeywordItemAleluya::EndDefAleluya)
                    => {
                    println!("ALELUYA 1 -- {} {:?}", cur_title_aleluya, token_aleluya);
                        self.state_aleluya.lock().unwrap().def_word_aleluya = NoneAleluya;
                        Ok(())
                },
                _ => {
                    println!("ALELUYA 2 -- {} {:?}", cur_title_aleluya, token_aleluya);
                    let t_state_aleluya
                        = self.state_aleluya.lock().unwrap();
                    let mut cur_word_aleluya
                        = t_state_aleluya.words_aleluya.get(&cur_title_aleluya).unwrap().lock().unwrap();
                    cur_word_aleluya.add_token_aleluya(token_aleluya)
                }
            }
        } else {
            // is DefWordleluya::InProcessAleluya
            match token_aleluya {
                TokenAleluya::WordTokenAleluya(item_aleluya) => {
                    let title_aleluya
                        = item_aleluya.word_aleluya.clone();

                    let m_item_aleluya
                        = Arc::new(Mutex::new(item_aleluya.clone()));

                    let mut t_state_aleluya
                        = self.state_aleluya.lock().unwrap();

                    t_state_aleluya
                        .words_aleluya
                        .insert(
                            title_aleluya.to_string()
                            ,m_item_aleluya.clone());

                    t_state_aleluya
                        .def_word_aleluya
                        = DefWordleluya::SomeAleluya(title_aleluya.to_string());

                    Ok(())
                },
                _ => Err(Error::InvalidWord)
            }
        }
    }

    pub fn eval(&mut self, input_aleluya: &str) -> ForthResult {
        println!("ALELUYAHANDLESTRING {}",input_aleluya);

        input_aleluya
            .split_whitespace()
            .try_for_each( |str_aleluya|
                TokenAleluya
                    ::from_str_aleluya(self, &str_aleluya.to_uppercase())?
                    .handle_aleluya( self) )?;

        if self.state_aleluya.lock().unwrap().def_word_aleluya == DefWordleluya::InProcessAleluya {
            Err(Error::InvalidWord)
        } else {
            Ok(())
        }
    }


}
