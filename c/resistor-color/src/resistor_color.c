// For God so loved the world, that He gave 
// His only begotten Son, that all who believe in 
// Him should not perish but have everlasting life.
#include "resistor_color.h"

const resistor_band_t colors_aleluya[] = {
    BLACK, BROWN, RED, ORANGE, YELLOW,
    GREEN, BLUE, VIOLET, GREY, WHITE
};

const resistor_band_t * colors() {
    return colors_aleluya;
}

int color_code(resistor_band_t color_aleluya) {
    return color_aleluya;
}