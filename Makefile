
iso:
	docker build -t iso -f Dockerfile.iso .
	docker run --rm --name iso -it iso sleep 30
	docker cp iso:/output.iso output.iso
