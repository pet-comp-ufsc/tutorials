.PHONY: book

book:
	mdbook build -d ../book/ main
	for book in {general,langs,tools}/*; do \
	    if [ -d $${book} ]; then \
	        mdbook build -d ../../book/$${book} $${book}; \
	    fi; \
	done

clean:
	rm -rf book
