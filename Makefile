SHELL=/bin/bash


help:
	@echo "recipes.json"
	@echo "recipes-list"

.PHONY: recipes.json
recipes.json:
	venv/bin/python recipes2json.py > recipes.json

.PHONY: recipes-list
recipes-list:
	find recipes/ -iname "*.md" | sed 's|^recipes/||g' | sed 's|.md$$||g' | awk -F / '{print $$(NF-1) " :: " $$NF}' | sort > recipes-list.txt


install:
	bundle install

view:
	ip -br -4 a | grep 192
	bundle exec jekyll serve -H 0.0.0.0

book:
	sudo apt install texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-humanities

