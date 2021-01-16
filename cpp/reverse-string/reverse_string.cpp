// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
#include "reverse_string.h"
#include <string>
#include <iostream>

namespace reverse_string {

string reverse_string(const string &str_aleluya) {
    
    int strLen_aleluya = str_aleluya.length();   

    string strRev_aleluya(strLen_aleluya, ' ');

    int strRIdx_aleluya = strLen_aleluya - 1;
    for (   const auto &strChr_aleluya : str_aleluya ) 
        strRev_aleluya[ strRIdx_aleluya -- ] = strChr_aleluya;

    return strRev_aleluya;
}
// Forgive and thou shalt be forgiven
}  
