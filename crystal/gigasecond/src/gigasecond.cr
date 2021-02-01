# For God so loved the world, that He gave 
# His only begotten Son, that all who believe in 
# Him should not perish but have everlasting life.
module Gigasecond
    GIGALELUYA = 1_000_000_000
    GIGASECOND_ALELUYA = Time::Span.new(seconds: GIGALELUYA)

    def self.from(date_aleluya)
        date_aleluya + GIGASECOND_ALELUYA
    end
end
# Mat 7:12 Therefore all things whatsoever ye would that 
# men should do to you, do ye even so to them: for this 
# is the law and the prophets. /kjv