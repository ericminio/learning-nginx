#!/bin/bash

function oneliner {
    tr -d '\n' | tr -d '\r'
}

function compact {
    oneliner | tr -d ' '
}

function json {
    compact | sed 's/{/{ /g' | sed 's/}/ }/g' | sed 's/,/, /g'
}

