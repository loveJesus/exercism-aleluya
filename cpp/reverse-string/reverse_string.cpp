// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
#include "reverse_string.h"
#include <string>
#include <iostream>

namespace reverse_string {
string reverse_string(string str_aleluya) {
    string rev_aleluya;
    int len_aleluya = str_aleluya.length();    
    for (   int i_aleluya = 0; 
            i_aleluya < len_aleluya;
            i_aleluya++ )
        rev_aleluya += str_aleluya.at(len_aleluya - 1 - i_aleluya);

    return rev_aleluya;
}
// Forgive and thou shalt be forgiven
}  
