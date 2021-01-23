// For God so loved the world, that He gave 
// His only begotten Son, that all who believe in 
// Him should not perish but have everlasting life.
using System;
using System.Collections.Generic;
using System.Linq;

public class HighScores : IComparer<int>
{
    List<int> scores_aleluya;

    private HighScores() {}

    public HighScores(List<int> list_aleluya) 
        => scores_aleluya = list_aleluya;    

    public int Compare(int a_aleluya, int b_aleluya) 
        => a_aleluya.CompareTo(b_aleluya);

    public List<int> Scores() 
        => scores_aleluya;

    public int Latest() 
        => scores_aleluya.Last();

    public int PersonalBest() 
        => scores_aleluya.Max();

    public List<int> PersonalTopThree() 
        => scores_aleluya
            .OrderByDescending(
                (num_aleluya) 
                => num_aleluya, new HighScores())
            .Take(3)
            .ToList();
}