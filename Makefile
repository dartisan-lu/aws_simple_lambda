.PHONY: build clean deploy

deploy:
	npx serverless deploy

remove:
	npx serverless remove
