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

# For extra glob features (e.g. ?, *, +, @, !)
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
        BASEPATH=""
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
    check-mdbook

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
    python -m http.server -d book
}

clean() {
    rm -rf book
}

check-mdbook() {
    if ! command -v mdbook &> /dev/null; then
      printf "${ERROR} ${book}: mdbook not found or is not installed"
    fi
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
