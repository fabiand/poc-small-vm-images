FROM docker.io/library/fedora

RUN dnf install -y genisoimage && dnf clean all

ENV BASEURL=https://download.fedoraproject.org/pub/fedora/linux/releases/27/Server/x86_64/os/isolinux
RUN mkdir -p /iso
RUN curl -L -o /iso/vmlinuz $BASEURL/vmlinuz
RUN curl -L -o /iso/initrd.img $BASEURL/initrd.img
RUN cd /iso/ && curl -LO \
  -LO $BASEURL/isolinux.bin \
  -LO $BASEURL/ldlinux.c32 \
  -LO $BASEURL/libcom32.c32 \
  -LO $BASEURL/libutil.c32 \
  -LO $BASEURL/vesamenu.c32

ADD isolinux.cfg /iso

# https://www.syslinux.org/wiki/index.php?title=ISOLINUX
# https://www.syslinux.org/wiki/index.php?title=Isohybrid
RUN mkisofs -o /output.iso -b isolinux.bin -c boot.cat \
  -no-emul-boot -boot-load-size 4 -boot-info-table \
  /iso && isohybrid /output.iso

RUN ls -shal /output.iso
