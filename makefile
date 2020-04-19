README.md: guessinggame.sh
	echo "## Bash, Make, Git, and GitHub  " > README.md
	echo "**make** was last run on: $$(date)  " >> README.md
	echo "**guessinggame.sh** has $$(cat guessinggame.sh | wc -l) lines  " >> README.md
