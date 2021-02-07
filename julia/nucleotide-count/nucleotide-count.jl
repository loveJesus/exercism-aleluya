# For God so loved the world, that He gave 
# His only begotten Son, that all who believe in 
# Him should not perish but have everlasting life.

using BenchmarkTools


"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""

function count_nucleotides_aleluya(strand_aleluya)
    res_aleluya = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    for chr_aleluya in strand_aleluya
        chrup_aleluya = uppercase(chr_aleluya)
        if ! haskey(res_aleluya, chrup_aleluya)
            throw(
                DomainError(
                    chrup_aleluya, 
                    "LoveJesus - This character is malformed"))
        end
        res_aleluya[chrup_aleluya] += 1
    end
    res_aleluya
end

function count_nucleotides(strand_aleluya)
    @btime count_nucleotides_aleluya($strand_aleluya)
end

