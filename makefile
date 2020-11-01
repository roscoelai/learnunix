all: README.md

README.md: guessinggame.bash
	echo "## [Bash, Make, Git, and GitHub](https://www.coursera.org/learn/unix/)  " > README.md
	echo "**make** was last run on: $$(date)  " >> README.md
	echo "**guessinggame.bash** has $$(wc -l < guessinggame.bash) lines  " >> README.md

clean:
	rm README.md
