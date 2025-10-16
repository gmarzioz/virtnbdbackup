#!/bin/bash
sudo dnf install libvirt-devel
python -m venv ../virtnbdbackup-env
cd ..
source virtnbdbackup-env/bin/activate
pip install -r requirements-fedora.txt

VENVDIR=$(pwd)/virtnbdbackup-venv
LIBNBD_MAJ="1.12-stable"
LIBNBD_VERSION="libnbd-1.12.6"
curl https://download.libguestfs.org/libnbd/${LIBNBD_MAJ}/${LIBNBD_VERSION}.tar.gz  > ${LIBNBD_VERSION}.tar.gz
tar xzf ${LIBNBD_VERSION}.tar.gz
cd ${LIBNBD_VERSION}
./configure --prefix=${VENVDIR}/lib --exec-prefix=${VENVDIR} \
    --disable-ocaml \
    --disable-golang \
    --disable-fuse
make -j 4
make install

cd ..
pip install .
