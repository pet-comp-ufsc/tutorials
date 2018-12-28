#!/usr/bin/bash
DEFAULT="\033[0m"

GREEN="\033[92m"
RED="\033[91m"
YELLOW="\033[93m"
OTHER="\033[90m"

INFO="[${YELLOW}INFO${DEFAULT}]"
ERROR="[${RED}ERROR${DEFAULT}]"
GOOD="[${GREEN}GOOD${DEFAULT}]"
SKIP="[${OTHER}SKIP${DEFAULT}]"

build-book() {
    local output=$1
    local book=$2

    printf "${INFO} Building ${book}...\n"
    mdbook build -d "${output}" "${book}"
}

build() {
    build-book ../book/ main
    build-book ../book/tools tools
    for book in {general,langs}/*; do
        if [ -d ${book} ]; then
            build-book "../../book/${book}" "${book}"
        else
            printf "${SKIP} ${book}: not a directory.\n"
        fi
    done
}

build
