all: README.md

README.md: guessinggame.sh
	echo "## [Bash, Make, Git, and GitHub](https://www.coursera.org/learn/unix/)  " > README.md
	echo "**make** was last run on: $$(date)  " >> README.md
	echo "**guessinggame.sh** has $$(cat guessinggame.sh | wc -l) lines  " >> README.md

cleanup:
	rm README.md
