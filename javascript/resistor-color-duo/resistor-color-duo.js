// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.

export const colorCode_aleluya = (color_aleluya) => 
    COLORS_ALELUYA.indexOf(color_aleluya);


export const decodedValue = (colors_aleluya) => {    
    var [c1_aleluya, c2_aleluya] = colors_aleluya;

    return (
        10 * colorCode_aleluya(c1_aleluya)
           + colorCode_aleluya(c2_aleluya) );
}

export const COLORS_ALELUYA = ['black', 'brown', 'red', 'orange', 'yellow', 
                                'green', 'blue', 'violet', 'grey', 'white'];

// Jesus is Lord

