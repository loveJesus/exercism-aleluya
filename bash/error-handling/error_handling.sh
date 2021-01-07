#!/usr/bin/env bash
#===============================================================================
#   For God so loved the world, that He gave His only begotten Son, 
#   that all who believe in Him should not perish but have everlasting life.
#
#          FILE:  error_handling.sh
#
#         USAGE:  ./error_handling.sh [who_aleluya]
#
#   DESCRIPTION:  Hello, [who_aleluya] with error handling
#
#       OPTIONS:  who_aleluya => Who we greet
#  REQUIREMENTS:  Must have exactly 1 argument (or prints help, err code 1)
#         NOTES:  If God had mercy on me, He can have mercy on you too!
#        AUTHOR:  LoveJesus
#       COMPANY:  in Jesus name
#       VERSION:  1.1
#       CREATED:  2020/01/07 6:18 PM UTC 
#      REVISION:  
#===============================================================================


main_aleluya () {
    if (( $# == 1 )); then
        who_aleluya=${1} 
        echo "Hello, $who_aleluya"
        exit 0
    else
        echo "Usage: error_handling.sh <person>"
        exit 1
    fi
}

main_aleluya "$@"