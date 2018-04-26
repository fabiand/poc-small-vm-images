| Build | [![Docker Repository on Quay](https://quay.io/repository/fabiand/poc-small-vm-images-dracut/status "Docker Repository on Quay")](https://quay.io/repository/fabiand/poc-small-vm-images-dracut) |
| Tests | [![Build Status](https://travis-ci.org/fabiand/poc-small-vm-images.svg?branch=master)](https://travis-ci.org/fabiand/poc-small-vm-images) |

# Building small images for Virtual Machines

| make target         | size     | description |
| ------------------- | -------- | ----------- |
| `output.dracut.iso` |    ~70MB | Using initrd + vmlinux from Fedora, drop into a dracut shell |
| `output.mkosi.img`  | ~1.500MB | Using mkosi and Fedora |

# Run

```
$ qemu-system-x86_64 -enable-kvm \
    -m 1024 -smp 4 \
    -machine q35 \
    -device virtio-rng-pci \
    -drive file=output.dracut.iso,if=virtio,format=raw
```
