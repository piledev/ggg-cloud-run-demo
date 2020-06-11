.PHONY: image, deploy, access

image:
	docker build .

deploy:
	gcloud run deploy helloworld --image gcr.io/ggg-cloud-run-demo/helloworld --platform managed --region=asia-northeast1 

access:
	curl https://helloworld-stovr3lzoa-an.a.run.app