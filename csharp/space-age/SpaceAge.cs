// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
using System;

public class SpaceAge
{
    private double earth_seconds_aleluya;

    static private readonly double second_per_year_aleluya = 60.0 * 60.0 * 24.0 * 365.25;

    public SpaceAge(int seconds_aleluya) => 
        this.earth_seconds_aleluya = seconds_aleluya;

    public double OnEarth() => this.earth_seconds_aleluya / second_per_year_aleluya;    

    public double OnMercury() => this.OnEarth() / 0.2408467;

    public double OnVenus() => this.OnEarth() / 0.61519726 ;

    public double OnMars() => this.OnEarth() / 1.8808158;

    public double OnJupiter() => this.OnEarth() / 11.862615;

    public double OnSaturn() => this.OnEarth() / 29.447498;

    public double OnUranus() => this.OnEarth() / 84.016846;

    public double OnNeptune() => this.OnEarth() / 164.79132;

}