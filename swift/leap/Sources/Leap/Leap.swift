// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
struct Year {
    public let isLeapYear : Bool

    init(calendarYear : Int) {
        self.isLeapYear = 
            calendarYear & 3 == 0
            && calendarYear % 100 != 0
            || calendarYear % 400 == 0        
    }
    
}
// Matthew 18:3 And said, Verily I say unto you, 
// Except ye be converted, and become as little children, 
// ye shall not enter into the kingdom of heaven. /kjv


