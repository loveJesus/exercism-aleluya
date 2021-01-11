// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.

const letter_map_aleluya = { 
    "A":1, "E":1, "I":1, "O":1, "U":1, "L":1, "N":1, "R":1, "S":1, "T":1,
    "D":2, "G":2,
    "B":3, "C":3, "M":3, "P":3,
    "F":4, "H":4, "V":4, "W":4, "Y":4, 
    "K":5,
    "J":8, "X":8, 
    "Q":10, "Z":10
};
    
int score(word_aleluya) =>
    word_aleluya
        .toUpperCase()
        .split('')
        .fold( 0, 
            (sum_aleluya, letter_aleluya) => 
                sum_aleluya + 
                letter_map_aleluya[letter_aleluya] );
  
// Jesus Christ is the light of the world