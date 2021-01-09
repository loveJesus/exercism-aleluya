// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
class Leap {
  // Put your code here
  bool leapYear([year_aleluya]) =>  
    ( year_aleluya % 4 == 0) && (
        (year_aleluya % 100 != 0) ||
        (year_aleluya % 400 == 0) );

}
