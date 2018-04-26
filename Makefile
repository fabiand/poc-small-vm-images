
iso:
	docker build -t iso -f Dockerfile.iso .
	docker run --rm --name iso -it iso sleep 30
	docker cp iso:/output.iso /tmp/output.iso

mkosi:
	docker build -t mkosi -f Dockerfile.mkosi .
	docker run --rm --name mkosi -it mkosi sleep 30
	docker cp mkosi:/output.mkosi /tmp/output.mkosi
