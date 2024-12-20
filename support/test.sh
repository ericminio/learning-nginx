#!/bin/bash

pass_color="\033[0;102;30m"
fail_color="\033[0;101;30m"
reset_color="\033[0m"
red="\033[0;91m"

function assertequals {
    if [ "$1" = "$2" ]; then
        return 0
    else
        FAILED_EXPECTATION="${fail_color}FAIL${reset_color}\n\nExpected: $2 \nBut was : $1"
        return 1
    fi
}
function assertmatch {
    if [[ "$1" =~ $2 ]]; then
        return 0
    else
        FAILED_EXPECTATION="${fail_color}FAIL${reset_color}\n\nExpected to match: $2 \nBut was          : $1"
        return 1
    fi
}
function files {
    find $folder -name "*.sh"
}
function all {
    cat $(files | sort) | grep -e "^function test_"
}
function only {
    grep -e "^function test_only"
}
function count {
    wc -l
}
function names {
    cut -d" " -f2
}
function run_test {
    echo $1
    $1
    if (( $? != 0 )); then
        echo -e "\n${red}$1${reset_color}"
        echo -e "$FAILED_EXPECTATION"
        exit 1
    fi
}

folder=$1
for f in $(files); do source $f; done

test=`all`
if (( `echo "$test" | only | count` > 0 )); then
    test=`echo "$test" | only`
fi

for name in `echo "$test" | names`; do
    run_test $name
done
testcount=`echo "$test" | count`
echo -e "\n${pass_color}PASS${reset_color} - $testcount test(s) run"