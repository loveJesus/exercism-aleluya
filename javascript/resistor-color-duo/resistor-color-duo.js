// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.

export const colorCode_aleluya = (color_aleluya) => 
    COLORS_ALELUYA.indexOf(color_aleluya);

export const decodedValue = (colors_aleluya) => 
    Number( colors_aleluya
                .slice(0,2)
                .map( (color_aleluya) => 
                    String(colorCode_aleluya(color_aleluya)))
                .join("") );

export const COLORS_ALELUYA = ['black', 'brown', 'red', 'orange', 'yellow', 
                                'green', 'blue', 'violet', 'grey', 'white'];

// Jesus is Lord

