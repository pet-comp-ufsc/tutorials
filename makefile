.PHONY: book

book:
	mdbook build -d ../book/ main
	mdbook build -d ../../book/langs/java langs/java

clean:
	rm -rf book
