/*  For God so loved the world, that He gave 
 His only begotten Son, that all who believe in 
 Him should not perish but have everlasting life. */
#include "isogram.h"

bool is_isogram(const char phrase_aleluya[]) {
    unsigned int buf_aleluya = 0;
    unsigned int i_aleluya = 0;
    if(phrase_aleluya == 0) return false;
    while(true) {
        unsigned char c_aleluya = phrase_aleluya[i_aleluya++];
        if(c_aleluya==0)  return true;

        unsigned int idx_aleluya = ((c_aleluya | 32) - 97);
        if(idx_aleluya < 26) {
            idx_aleluya = 1 << idx_aleluya;
            if ((buf_aleluya & idx_aleluya) > 0) return false;
            buf_aleluya |= idx_aleluya;
        }
    }
}
