/**
 * For God so loved the world, that He gave His only begotten Son, 
 * that all who believe in Him should not perish but have everlasting life. 
 **/
class Hamming {

    def distance(strand1Aleluya, strand2Aleluya) {
        if( strand1Aleluya.length() 
            != strand2Aleluya.length() )
            throw new ArithmeticException()
        
        [ strand1Aleluya.split('') 
         ,strand2Aleluya.split('') ]
            .transpose()
            .count {
            chr1Aleluya, chr2Aleluya ->
                chr1Aleluya != chr2Aleluya }
    }
}