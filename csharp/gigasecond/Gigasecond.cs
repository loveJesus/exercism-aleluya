// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
using System;

///<summary>Hallelujah, working with billion second units</summary>
public static class Gigasecond
{
	private const int gigaleluya = 1_000_000_000;
	
	///<summary>Hallelujah, Return <c>DateTime</c> of one billion seconds added to 
	///a moment in time<summary>
    public static DateTime Add(DateTime moment_aleluya) => 	
        moment_aleluya.AddSeconds(gigaleluya);
    
}
