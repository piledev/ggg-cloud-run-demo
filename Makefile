.PHONY: image, deploy

image:
	# container build
	docker build .

deploy:
	# deploy
	gcloud run deploy helloworld --image gcr.io/ggg-cloud-run-demo/helloworld --platform managed --region=asia-northeast1 
	curl https://helloworld-stovr3lzoa-an.a.run.app