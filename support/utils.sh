#!/bin/bash

function oneliner {
    tr -d '\r\n'
}

function shrink {
    sed -E 's/[ ]+/ /g'
}

function compact {
    tr -d ' '
}

function trim {
    oneliner | shrink | sed -E 's/(^[ ]*|[ ]*$)//g'
}

function json {
    oneliner | compact | sed -e 's/{/{ /g' -e 's/}/ }/g' -e 's/,/, /g'
}