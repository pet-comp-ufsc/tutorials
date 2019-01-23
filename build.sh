#!/bin/bash
DEFAULT="\033[0m"

GREEN="\033[92m"
RED="\033[91m"
YELLOW="\033[93m"
OTHER="\033[90m"

INFO="[${YELLOW}INFO${DEFAULT}]"
ERROR="[${RED}ERROR${DEFAULT}]"
GOOD="[${GREEN}GOOD${DEFAULT}]"
SKIP="[${OTHER}SKIP${DEFAULT}]"

shopt -s extglob

FUNCTIONS="build|clean|serve"

build-book() {
    local book=$1

    printf "${INFO} Building ${book}...\n"
    mdbook build "${book}"
}

fix-js-path() {
    local pat="src=\"\(.*\)\(special-.*.js\)\""

    if [ $1 = "--local" ];
    then
        BASEPATH="$(pwd)/book"
        local dst="src=\"${BASEPATH//\//\\/}\/js\/\2\""
        echo "Fixing JS paths (local build)..."
    else
        local dst="src=\"\/tutorials\/js\/\2\""
        echo "Fixing JS paths..."
    fi

    for file in $(find -name "*.html");
    do
        sed -i "s/${pat}/${dst}/g" "${file}"
    done
}

nofun() {
    if [ -z $1 ]; then
        echo "Usage: ${0} <function>"
    else
        echo "No function \"${1}\"."
    fi

    echo "Available functions: "
    echo "    $(echo ${FUNCTIONS} | sed 's/|/\n    /g')"
    exit 1
}

# Commands

build() {
    echo "Build flags: $*"

    build-book main
    build-book tools

    for book in {general,langs}/*; do
        if [ -f ${book} ]; then
            printf "${SKIP} ${book}: not a directory.\n"
        elif [ ! -d "${book}/src" ]; then
            printf "${SKIP} ${book}: not a valid mdbook.\n"
        else
            build-book "${book}"
        fi
    done

    fix-js-path $1
}

serve() {
    build
    mdbook serve -d book/ -p 3004
}

clean() {
    rm -rf book
}

FS="@(${FUNCTIONS})"
case $1 in
    ${FS})
        $*
        ;;
    *)
        nofun $*
        ;;
esac
