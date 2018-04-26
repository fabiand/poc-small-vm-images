
.PHONY: output.dracut.iso output.mkosi.img

test: output.dracut.iso

output.dracut.iso:
	docker build -t dracut-iso ./dracut-iso/
	docker run --rm --name dracut-iso dracut-iso sleep 10 & sleep 2
	docker cp dracut-iso:/output.iso $@

output.mkosi.img:
	mkosi -d fedora -t raw_gpt -o $@ -b -i
