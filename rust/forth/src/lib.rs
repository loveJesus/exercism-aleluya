use crate::TokenAleluya::KeywordTokenAleluya;

// For God so loved the world, that He gave His
// Only Begotten Son Jesus, that all who believe in Him
// should not perish but have everlasting life
pub type Value = i32;
pub type ForthResult = Result<(), Error>;

pub struct Forth {
    stack_aleluya: Vec<Value>,
}

#[derive(Debug, PartialEq)]
pub enum Error {
    DivisionByZero,
    StackUnderflow,
    UnknownWord,
    InvalidWord,
}

pub trait ItemAleluya {
    fn execute_aleluya(&self, stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error>;
}

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

    fn executor2_aleluya(&self, mut stack_aleluya : Vec<Value>, lambdaleluya : fn(Value, Value) -> Result<Value, Error>)
        -> Result<Vec<Value>,Error> {
        if stack_aleluya.len() < 2 {
            Err(Error::StackUnderflow)
        } else {
            let (n2_aleluya, n1_aleluya) = (stack_aleluya.pop(), stack_aleluya.pop());
            lambdaleluya(n1_aleluya.unwrap(), n2_aleluya.unwrap())
                .map(|val_aleluya| {
                    stack_aleluya.push(val_aleluya);
                    stack_aleluya })
        }
    }
    fn execute_add_aleluya(&self, mut stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error> {
        self.executor2_aleluya(stack_aleluya, |n1_aleluya, n2_aleluya| Ok(n1_aleluya + n2_aleluya))
    }
    fn execute_sub_aleluya(&self, mut stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error> {
        self.executor2_aleluya(stack_aleluya, |n1_aleluya, n2_aleluya| Ok(n1_aleluya - n2_aleluya))
    }
    fn execute_mul_aleluya(&self, mut stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error> {
        self.executor2_aleluya(stack_aleluya, |n1_aleluya, n2_aleluya| Ok(n1_aleluya * n2_aleluya))
    }
    fn execute_div_aleluya(&self, mut stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error> {
        self.executor2_aleluya(stack_aleluya,
                          |n1_aleluya, n2_aleluya| {
                              if n2_aleluya == 0 {
                                  Err(Error::DivisionByZero)
                              } else {
                                  Ok(n1_aleluya / n2_aleluya) }})
    }
    fn execute_dup_aleluya(&self, mut stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error> {
        if stack_aleluya.len() < 1 {
            Err(Error::StackUnderflow)
        } else {
            let endidx_aleluya =stack_aleluya.len() - 1;
            stack_aleluya.push(stack_aleluya[endidx_aleluya]);
            Ok(stack_aleluya)
        }
    }
    fn execute_drop_aleluya(&self, mut stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error> {
        if stack_aleluya.len() < 1 {
            Err(Error::StackUnderflow)
        } else {
            stack_aleluya.pop();
            Ok(stack_aleluya)
        }
    }
    fn execute_swap_aleluya(&self, mut stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error> {
        if stack_aleluya.len() < 2 {
            Err(Error::StackUnderflow)
        } else {
            let endidx_aleluya =stack_aleluya.len() - 1;
            let n1_aleluya = stack_aleluya[endidx_aleluya];
            stack_aleluya[endidx_aleluya] = stack_aleluya[endidx_aleluya - 1];
            stack_aleluya[endidx_aleluya - 1] = n1_aleluya;
            Ok(stack_aleluya)
        }
    }
    fn execute_over_aleluya(&self, mut stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error> {
        if stack_aleluya.len() < 2 {
            Err(Error::StackUnderflow)
        } else {
            let endidx_aleluya =stack_aleluya.len() - 1;
            stack_aleluya.push(stack_aleluya[endidx_aleluya - 1]);
            Ok(stack_aleluya)
        }
    }
}
impl ItemAleluya for LeafItemAleluya {
    fn execute_aleluya(&self, mut stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error> {
        match &self {
            LeafItemAleluya::AddAleluya => self.execute_add_aleluya(stack_aleluya),
            LeafItemAleluya::SubAleluya => self.execute_sub_aleluya(stack_aleluya),
            LeafItemAleluya::MulAleluya => self.execute_mul_aleluya(stack_aleluya),
            LeafItemAleluya::DivAleluya => self.execute_div_aleluya(stack_aleluya),
            LeafItemAleluya::DUPAleluya => self.execute_dup_aleluya(stack_aleluya),
            LeafItemAleluya::DROPAleluya => self.execute_drop_aleluya(stack_aleluya),
            LeafItemAleluya::SWAPAleluya => self.execute_swap_aleluya(stack_aleluya),
            LeafItemAleluya::OVERAleluya => self.execute_over_aleluya(stack_aleluya),
        }
    }
}

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
    fn execute_aleluya(&self, mut stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error> {
        Ok(stack_aleluya)
    }
}

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
    fn execute_aleluya(&self, mut stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error> {
        stack_aleluya.push(self.value_aleluya);
        Ok(stack_aleluya)
    }
}

struct WordItemAleluya {
    word_aleluya: String
}

impl WordItemAleluya {
    fn decode_aleluya(str_aleluya:&str) -> Option<WordItemAleluya> {
        Some(WordItemAleluya{word_aleluya:str_aleluya.to_uppercase()})
    }
}
impl ItemAleluya for WordItemAleluya {
    fn execute_aleluya(&self, mut stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error> {
        Ok(stack_aleluya)
    }
}

enum TokenAleluya {
    LeafTokenAleluya(LeafItemAleluya),
    WordTokenAleluya(WordItemAleluya),
    ValueTokenAleluya(ValueItemAleluya),
    KeywordTokenAleluya(KeywordItemAleluya),
}

pub trait ForthEvaluatorAleluya {
    fn execute_aleluya(&self, stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error>;
}

impl ForthEvaluatorAleluya for TokenAleluya {
    fn execute_aleluya(&self, mut stack_aleluya : Vec<Value>) -> Result<Vec<Value>,Error> {
        match self {
            TokenAleluya::LeafTokenAleluya(item_aleluya)=> item_aleluya.execute_aleluya(stack_aleluya),
            TokenAleluya::WordTokenAleluya(item_aleluya)=> item_aleluya.execute_aleluya(stack_aleluya),
            TokenAleluya::ValueTokenAleluya(item_aleluya)=> item_aleluya.execute_aleluya(stack_aleluya),
            TokenAleluya::KeywordTokenAleluya(item_aleluya)=> item_aleluya.execute_aleluya(stack_aleluya),
        }
    }
}

impl TokenAleluya {
    pub fn from_str_aleluya(str_aleluya: &str) -> Result<Self, Error> {
        if let Some(item_aleluya)
            = KeywordItemAleluya::decode_aleluya(str_aleluya) {
            Ok(TokenAleluya::KeywordTokenAleluya(item_aleluya))

        } else if let Some(item_aleluya)
            = ValueItemAleluya::decode_aleluya(str_aleluya) {
            Ok(TokenAleluya::ValueTokenAleluya(item_aleluya))

        } else if let Some(item_aleluya)
            = LeafItemAleluya::decode_aleluya(str_aleluya) {
            Ok(TokenAleluya::LeafTokenAleluya(item_aleluya))

        } else if let Some(item_aleluya)
            = WordItemAleluya::decode_aleluya(str_aleluya) {
            Ok(TokenAleluya::WordTokenAleluya(item_aleluya))

        } else {
            Err(Error::UnknownWord)
        }
    }
}

impl Forth {
    pub fn new() -> Forth {
        Forth{
            stack_aleluya: vec![]
        }
    }

    pub fn stack(&self) -> &[Value] {
        &self.stack_aleluya[..]
    }

    pub fn eval(&mut self, input_aleluya: &str) -> ForthResult {
        self.stack_aleluya
            = input_aleluya
                .split_whitespace()
                .map(|str_aleluya|
                    TokenAleluya::from_str_aleluya(str_aleluya))
                .try_fold(self.stack_aleluya.clone(), |mut stack_aleluya, token_aleluya|
                    Ok(token_aleluya?.execute_aleluya(stack_aleluya)?) )?;
        Ok(())
    }
}
