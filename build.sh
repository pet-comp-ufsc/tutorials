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

fix-js-css-path() {
    if [ "$1" = "--css" ];
    then
        local ext="css"
        local tag="href"
        shift
    else
        local ext="js"
        local tag="src"
    fi

    local pat="${tag}=\"\(.*\)\(special-.*.${ext}\)\""

    if [ "$1" = "--local" ];
    then
        BASEPATH="$(pwd)/book"
        local dst="${tag}=\"${BASEPATH//\//\\/}\/${ext}\/\2\""
        echo "Fixing ${ext} paths (local build)..."
        echo "    -> pat: ${pat}"
        echo "    -> dst: ${dst}"
    else
        local dst="${tag}=\"\/tutorials\/${ext}\/\2\""
        echo "Fixing ${ext} paths..."
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
    build-book general

    for book in langs/*; do
        if [ -f ${book} ]; then
            printf "${SKIP} ${book}: not a directory.\n"
        elif [ ! -d "${book}/src" ]; then
            printf "${SKIP} ${book}: not a valid mdbook.\n"
        else
            build-book "${book}"
        fi
    done

    fix-js-css-path $1
    fix-js-css-path --css $1
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
