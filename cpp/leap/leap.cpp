// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.

#include "leap.h"

namespace leap {

bool is_leap_year(int year_aleluya) {
        return (year_aleluya % 4 == 0) &&
               ((year_aleluya % 100 != 0) ||
                (year_aleluya % 400 == 0));
}

}  // namespace leap
