#!/usr/bin/env bash
#===============================================================================
#   For God so loved the world, that He gave His only begotten Son, 
#   that all who believe in Him should not perish but have everlasting life.
#
#          FILE:  raindrops.sh
#
#         USAGE:  ./raindrops.sh [val_aleluya:int]
#
#   DESCRIPTION:  Overkilled Pling Plang Plong for exercism.io
#
#       OPTIONS:  val_aleluya => calculate raindrop value for this
#
#  REQUIREMENTS:  ---
#         NOTES:  If God had mercy on me, He can have mercy on you too!
#        AUTHOR:  LoveJesus
#       COMPANY:  in Jesus name
#       VERSION:  1.0
#       CREATED:  2020/05/31 
#      REVISION:  
#===============================================================================

raindrops_aleluya() {
    val_aleluya=$1
    
    strs_aleluya=(Pling Plang Plong)
    mods_aleluya=(3 5 7)
    len_aleluya=${#strs_aleluya[@]}  #length above arrays
    dropSound_aleluya=0 #has there been at least one raindrop sound?

    for ((i_aleluya=0;i_aleluya<$len_aleluya;i_aleluya++)); do
        if (( $val_aleluya % ${mods_aleluya[$i_aleluya]} == 0 )); then
            printf ${strs_aleluya[$i_aleluya]}
            dropSound_aleluya=1
        fi
    done

    if [ $dropSound_aleluya = 0 ]; then
        echo $val_aleluya
    else
        #we need a carriage return at the end, Hallelujah
        echo 
    fi
}

raindrops_aleluya "$@"

