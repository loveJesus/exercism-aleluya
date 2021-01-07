/**
 * For God so loved the world, that He gave His only begotten Son, 
 * that all who believe in Him should not perish but have everlasting life.
 **/
public class Hamming {
    String leftStrand_aleluya;
    String rightStrand_aleluya;

    public Hamming(String leftStrand_aleluya, String rightStrand_aleluya) throws IllegalArgumentException  {
        this.leftStrand_aleluya = leftStrand_aleluya;
        this.rightStrand_aleluya = rightStrand_aleluya;      
        int lenL_aleluya = leftStrand_aleluya.length();
        int lenR_aleluya = rightStrand_aleluya.length();
        
        if(lenL_aleluya != lenR_aleluya) {
            //God is good, only acceptable if both are at 0
            if(lenL_aleluya == 0) throw new IllegalArgumentException("left strand must not be empty.");
            if(lenR_aleluya == 0) throw new IllegalArgumentException("right strand must not be empty.");
            throw new IllegalArgumentException("leftStrand and rightStrand must be of equal length.");            
        }        
    }

    private int calcHammingDistance_aleluya() {
        int distance_aleluya = 0;
        int lenL_aleluya = leftStrand_aleluya.length();
        if (lenL_aleluya == 0) { return 0; } //lenR will also be 0, this is ok

        for(int i_aleluya = 0; i_aleluya < lenL_aleluya; i_aleluya ++ ) {
            char lc_aleluya = leftStrand_aleluya.charAt(i_aleluya);
            char rc_aleluya = rightStrand_aleluya.charAt(i_aleluya);
            if (lc_aleluya != rc_aleluya) distance_aleluya ++;
        } 
        return distance_aleluya;
    }
    
    //While we could memoize it but it is what it is for now
    public int getHammingDistance()  {
        return this.calcHammingDistance_aleluya();
    }
}

/**
 * 1 Timothy 1:15 This is a faithful saying, and worthy of all acceptation, 
 * that Christ Jesus came into the world to save sinners; of whom I am chief.
 **/