#!/bin/bash

function trim {
    sed 's/\r//g' | xargs echo -n
}