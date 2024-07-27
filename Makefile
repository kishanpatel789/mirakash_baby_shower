BASEDIR=$(CURDIR)
OUTPUTDIR=$(BASEDIR)/main

S3_BUCKET=mirakash-baby-site
CLOUDFRONT_ID=

devserver:
	python -m http.server -d main

s3_upload: 
	aws s3 sync "$(OUTPUTDIR)" s3://$(S3_BUCKET) --delete

cf_invalidate:  
	aws cloudfront create-invalidation --distribution-id $(CLOUDFRONT_ID) --paths "/*"


