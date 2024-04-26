#!/bin/bash

function trim {
    sed "s/^[ $(printf '\n')$(printf '\r')]*//g" | sed "s/[ $(printf '\n')$(printf '\r')]*$//g"
}

function oneliner {
    tr -d '\n' | tr -d '\r'
}

function compact {
    oneliner | tr -d ' '
}

function json {
    compact | sed 's/{/{ /g' | sed 's/}/ }/g' | sed 's/,/, /g'
}


function test_only_trim {
    a=" $(printf '\r\n')  123  $(printf '\r\n')  "
    b=$(printf "%s" "$a" | trim)

    assertequals "$b" "123"
}