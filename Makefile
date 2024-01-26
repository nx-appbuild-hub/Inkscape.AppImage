# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)


all: clean
	mkdir --parents $(PWD)/build/Boilerplate.AppDir
	apprepo --destination=$(PWD)/build appdir boilerplate libatk1.0-0 libatk-bridge2.0-0 libgtk-3-0 libreadline8 \
										libselinux1 libtinfo6 libncurses6 libtinfo5 libssh-4

	wget --output-document=$(PWD)/build/Inkscape.AppImage https://inkscape.org/gallery/item/42330/Inkscape-0e150ed-x86_64.AppImage
	chmod +x $(PWD)/build/Inkscape.AppImage
	cd $(PWD)/build && $(PWD)/build/Inkscape.AppImage --appimage-extract

	rm -rf $(PWD)/build/Boilerplate.AppDir/lib64/x86_64-linux-gnu
	rm -rf $(PWD)/build/squashfs-root/usr/share/metainfo/org.inkscape.Inkscape.appdata.xml	

	cp --recursive --force $(PWD)/build/Boilerplate.AppDir/share/* $(PWD)/build/squashfs-root/usr/share || true

	sed -i '3iXDG_DATA_DIRS=\$${XDG_DATA_DIRS}:\$${APPDIR}/share' $(PWD)/build/squashfs-root/AppRun
	sed -i '4iexport XDG_DATA_DIRS=\$${XDG_DATA_DIRS}' $(PWD)/build/squashfs-root/AppRun

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/squashfs-root $(PWD)/Inkscape.AppImage
	chmod +x $(PWD)/Inkscape.AppImage

clean:
	rm -rf $(PWD)/*.AppImage
	rm -rf $(PWD)/build
