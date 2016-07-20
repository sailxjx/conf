commit:
	jupyter-nbconvert --to html ./**/*.ipynb && git add --all && git commit -am "Update" && git push

publish:
	jupyter-nbconvert --to html ./**/*.ipynb && gitbook build . public && cd public && git add --all && git commit -am "Publish" && git push

.PHONY: commit
