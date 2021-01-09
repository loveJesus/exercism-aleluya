/**
 * For God so loved the world, that He gave His only begotten Son, 
 * that all who believe in Him should not perish but have everlasting life. 
 **/
class Hamming {

    def distance(strand1_aleluya, strand2_aleluya) {
        if (strand1_aleluya.length() != strand2_aleluya.length())
            throw new ArithmeticException()
        
        int sum_aleluya = 0
        int maxlen_aleluya = strand1_aleluya.length()

        for(    int idx_aleluya = 0; 
                idx_aleluya < maxlen_aleluya; 
                idx_aleluya ++ ) {

            if( strand1_aleluya.getAt(idx_aleluya) 
                != strand2_aleluya.getAt(idx_aleluya) )
                sum_aleluya += 1
        }

        sum_aleluya
    }

}