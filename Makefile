
iso:
	docker build -t iso -f Dockerfile.iso .
	docker run --rm --name iso -it iso sleep 30
	docker cp iso:/output.iso /tmp/output.iso

mkosi:
	mkosi -d fedora -t raw_gpt -o output.img -b -i
