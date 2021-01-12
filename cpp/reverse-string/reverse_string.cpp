// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
#include "reverse_string.h"
#include <string>
#include <iostream>

namespace reverse_string {

string reverse_string(string str_aleluya) {
    
    int len_aleluya = str_aleluya.length();   

    // @kunaltyagi exr: Not new string per iterating
    string rev_aleluya(len_aleluya, ' ');

    // @kunaltyagi exr : 
    // for based range loops https://en.cppreference.com/w/cpp/language/range-for
    int ridx_aleluya = len_aleluya - 1;
    for (   auto chr_aleluya : str_aleluya ) 
        rev_aleluya[ ridx_aleluya -- ] = chr_aleluya;

    return rev_aleluya;
}
// Forgive and thou shalt be forgiven
}  
