#!/bin/bash

cd /home/ 								&& \
rm -rf /root/rpmbuild/{SOURCES,BUILD,BUILDROOT,RPMS,SRPMS}/*			&& \
tar -cavf /root/rpmbuild/SOURCES/qemu-8.1.0.tar.xz $(find qemu-8.1.0 -mindepth 1 -maxdepth 1 -not -path 'qemu-8.1.0/.git*')	&& \
cd /home/qemu-8.1.0								&& \
cp -ra qemu-kvm.spec /root/rpmbuild/SPECS/					&& \
rpmbuild -ba /root/rpmbuild/SPECS/qemu-kvm.spec 2>&1 | tee /root/rpmbuild/qemu_build.log

