default: commit publish

commit:
	jupyter-nbconvert --to markdown ./**/*.ipynb && git add --all && git commit -am "Update" && git push

publish:
	rm -rf public/* && cp .gitignore ./public/.gitignore && \
		jupyter-nbconvert --to markdown ./**/*.ipynb && \
		gitbook build . public && \
		cd public && git add --all && git commit -am "Publish" && git push

.PHONY: commit publish
