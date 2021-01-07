# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.

leap <- function(year) {
    ( year %% 4 == 0 ) &&
    ( year %% 100 != 0 ) || 
    ( year %% 400 == 0 )
}
