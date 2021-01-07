# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
"""
    is_leap_year(year_aleluya)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
function is_leap_year(year_aleluya)
    (year_aleluya % 4 == 0) && (
        (year_aleluya % 100 != 0) ||
        (year_aleluya % 400 == 0))
end

