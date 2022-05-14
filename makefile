# makefile
# 2022-05-14

FILENAME := guessinggame.sh

all: README.md hidden-files

README.md: ${FILENAME}
	echo "## [Bash, Make, Git, and GitHub](https://www.coursera.org/learn/unix/)  " > README.md
	echo "**make** was last run on: $$(date)  " >> README.md
	echo "**${FILENAME}** has $$(wc -l < ${FILENAME}) lines  " >> README.md

hidden-files: ${FILENAME}
	touch .hidden_file_1
	touch ..hidden_file_2

clean:
	rm README.md
	rm .hidden_file_1
	rm ..hidden_file_2

