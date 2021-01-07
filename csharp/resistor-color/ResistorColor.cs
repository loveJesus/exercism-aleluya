// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
using System;

///<summary>Hallelujah, working with billion second units</summary>
public static class ResistorColor
{
    private static readonly string[] colors_aleluya = {
        "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"
    };
    
    ///<summary>Hallelujah, return <c>int</c> color code or exception if not found<summary>
    public static int ColorCode(string color)
    {
        var idx_aleluya = Array.IndexOf(Colors(), color);
        if (idx_aleluya == -1) { throw new Exception("Aleluya - invalid color"); }
        return idx_aleluya;
    }

    ///<summary>Hallelujah, Return <c>string[]</c> of colors we work with<summary>
    public static string[] Colors()
    {
        return colors_aleluya;
    }
}