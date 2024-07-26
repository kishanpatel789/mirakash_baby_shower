S3_BUCKET=kp-data-dev-site
CLOUDFRONT_ID=E3LKPMK8I8304X

s3_upload: 
	aws s3 sync "$(OUTPUTDIR)"/ s3://$(S3_BUCKET) --delete

cf_invalidate:  
	aws cloudfront create-invalidation --distribution-id $(CLOUDFRONT_ID) --paths "/*"


