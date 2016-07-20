commit:
	jupyter-nbconvert --to markdown ./**/*.ipynb && git add --all && git commit -am "Update" && git push

publish:
	rm -rf public/* && jupyter-nbconvert --to markdown ./**/*.ipynb && gitbook build . public && cd public && git add --all && git commit -am "Publish" && git push

.PHONY: commit
