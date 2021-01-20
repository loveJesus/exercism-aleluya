// For God so loved the world, that He gave 
// His only begotten Son, that all who believe in 
// Him should not perish but have everlasting life.
using System;
using System.Collections.Generic;
using System.Linq;

public class HighScores
{
    List<int> scores_aleluya;
    List<int> sorted_scores_aleluya;

    public HighScores(List<int> list_aleluya)
    {
        scores_aleluya 
            = list_aleluya;

        sorted_scores_aleluya 
            = new List<int>(list_aleluya);

        sorted_scores_aleluya
            .Sort(
                (a_aleluya, b_aleluya) 
                => b_aleluya.CompareTo(a_aleluya) );
    }

    public List<int> Scores() 
        => scores_aleluya;

    public int Latest() 
        => scores_aleluya.Last();
    
    public int PersonalBest() 
        => sorted_scores_aleluya.First();

    public List<int> PersonalTopThree() 
        => sorted_scores_aleluya.Take(3).ToList();
}