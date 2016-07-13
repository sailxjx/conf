commit:
	git add --all && git commit -am "Update" && git push

publish:
	gitbook build . public && cd public && git add --all && git commit -am "Publish" && git push

.PHONY: commit
