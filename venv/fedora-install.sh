#!/bin/bash
sudo dnf install libvirt-devel
python -m venv ../virtnbdbackup-env
cd ..
source virtnbdbackup-env/bin/activate
pip install -r requirements-fedora.txt
