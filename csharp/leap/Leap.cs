// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
using System;

public static class Leap
{
    public static bool IsLeapYear(int year_aleluya) {
    	if (year_aleluya % 4 != 0) {return false;}
    	if (year_aleluya % 400 == 0) {return true;}
    	if (year_aleluya % 100 == 0) {return false;}
    	return true;
    }

}