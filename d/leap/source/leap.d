// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
module leap;

bool isLeap(int year_aleluya) {

    return year_aleluya % 4 == 0
           && year_aleluya % 100 != 0
           || year_aleluya % 400 == 0;
}

unittest
{
    immutable int allTestsEnabled = 1;

    // Year not divisible by 4 in common year
    assert(!isLeap(2015));

    static if (allTestsEnabled)
    {
        // Year divisible by 2, not divisible by 4 in common year
        assert(!isLeap(1970));

        // Year divisible by 4, not divisible by 100 in leap year
        assert(isLeap(1996));

        // Year divisible by 4 and 5 is still a leap year
        assert(isLeap(1960));

        // Year divisible by 100, not divisible by 400 in common year
        assert(!isLeap(2100));

        // Year divisible by 100 but not by 3 is still not a leap year
        assert(!isLeap(1900));

        // Year divisible by 400 in leap year
        assert(isLeap(2000));

        // Year divisible by 400 but not by 125 is still a leap year
        assert(isLeap(2400));

        // Year divisible by 200, not divisible by 400 in common year
        assert(!isLeap(1800));
    }
}
