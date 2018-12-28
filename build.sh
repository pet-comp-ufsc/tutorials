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

build() {
    mdbook build -d ../book/ main
    for book in {general,langs,tools}/*; do
        if [ -d ${book} ]; then
            printf "${INFO} Building ${book}...\n"
            mdbook build -d ../../book/${book} ${book}
        else
            printf "${SKIP} ${book}: not a directory.\n"
        fi
    done
}

build
