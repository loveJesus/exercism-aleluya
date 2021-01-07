#!/usr/bin/env bash
#===============================================================================
#   For God so loved the world, that He gave His only begotten Son, 
#   that all who believe in Him should not perish but have everlasting life.
#
#          FILE:  two_fer.sh
#
#         USAGE:  ./two_fer.sh [who_aleluya]
#
#   DESCRIPTION:  One for [who_aleluya] and one for me. for exercism.io
#
#       OPTIONS:  who_aleluya => Who gets the other one, empty means its you
#  REQUIREMENTS:  ---
#         NOTES:  If God had mercy on me, He can have mercy on you too!
#        AUTHOR:  LoveJesus
#       COMPANY:  in Jesus name
#       VERSION:  1.1
#       CREATED:  2020/01/03 
#      REVISION:  1.1 2020/01/04 7:31:01 PM CST
#===============================================================================

main_aleluya () {
    who_aleluya=${1:-you} 
    echo "One for $who_aleluya, one for me."
}

main_aleluya "$@"
