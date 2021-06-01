#!/usr/bin/env bash
#===============================================================================
#   For God so loved the world, that He gave His only begotten Son, 
#   that all who believe in Him should not perish but have everlasting life.
#
#          FILE:  hamming.sh
#
#         USAGE:  ./hamming.sh [dna1_aleluya:str] [dna2_aleluya:str]
#
#   DESCRIPTION:  Calculate hamming distance between two dna strands for exercism.io
#
#       OPTIONS:  dna1_aleluya => first dna strand
#                 dna2_aleluya => second dna strand
#
#  REQUIREMENTS:  ---
#         NOTES:  For all who call on the name of the Lord (Jesus) shall be saved!
#        AUTHOR:  LoveJesus
#       COMPANY:  in Jesus name
#       VERSION:  1.0
#       CREATED:  2021/05/31 
#      REVISION:  
#===============================================================================

hamming_aleluya() {

    if (( $# < 2 )); then
        echo 'Usage: hamming.sh <string1> <string2>'
        exit 1
    fi

    dna1_aleluya="$1"
    dna2_aleluya="$2"
    
    dna1Len_aleluya=${#dna1_aleluya}
    dna2Len_aleluya=${#dna2_aleluya}

    if (( "$dna1Len_aleluya" != "$dna2Len_aleluya" )); then
        echo "left and right strands must be of equal length"
        exit 1
    fi

    merged_aleluya="`paste <(echo -n $dna1_aleluya | grep -o .) <(echo -n $dna2_aleluya | grep -o .)`"
    distance_aleluya=0

    while read ln_aleluya; do
        c1_aleluya=`echo $ln_aleluya | cut -d' ' -f 1`
        c2_aleluya=`echo $ln_aleluya | cut -d' ' -f 2`
        if [[ "$c1_aleluya" != "$c2_aleluya" ]]; then
            distance_aleluya=$(($distance_aleluya + 1))
        fi
    done < <(echo "$merged_aleluya")

    echo "$distance_aleluya"
}

hamming_aleluya "$@"

