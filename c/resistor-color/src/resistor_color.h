/**
 * For God so loved the world, that He gave 
 * His only begotten Son, that all who believe in 
 * Him should not perish but have everlasting life.
 *
 * Work with resistor colors
 *
 **/
#ifndef RESISTOR_COLOR_H
#define RESISTOR_COLOR_H

typedef enum {
    BLACK, BROWN, RED, ORANGE, YELLOW,
    GREEN, BLUE, VIOLET, GREY, WHITE
} resistor_band_t;

const resistor_band_t * colors();
int color_code(resistor_band_t);

#endif
