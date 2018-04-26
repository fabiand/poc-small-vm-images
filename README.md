[![Docker Repository on Quay](https://quay.io/repository/fabiand/poc-small-vm-images-dracut/status "Docker Repository on Quay")](https://quay.io/repository/fabiand/poc-small-vm-images-dracut)
[![Build Status](https://travis-ci.org/fabiand/poc-small-vm-images.svg?branch=master)](https://travis-ci.org/fabiand/poc-small-vm-images)

# Overview

| make target         | size     | description |
| ------------------- | -------- | ----------- |
| `output.dracut.iso` |    ~70MB | Using initrd + vmlinux from Fedora, drop into a dracut shell |
| `output.mkosi.img`  | ~1.500MB | Using mkosi and Fedora |

# Build

Run the make target above

# Try

```
$ docker run --rm -name dracutiso quay.io/fabiand/poc-small-vm-images-dracut sleep 10
$ docker cp dracutiso:/output.iso output.dracut.iso
$ qemu-system-x86_64 -enable-kvm \
    -m 1024 -smp 4 \
    -machine q35 \
    -device virtio-rng-pci \
    -drive file=output.dracut.iso,if=virtio,format=raw
```
