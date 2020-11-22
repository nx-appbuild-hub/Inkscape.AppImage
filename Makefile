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
DESTINATION:="Inkscape.AppImage"
PWD:=$(shell pwd)


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(PWD)/Inkscape.AppImage https://inkscape.org/gallery/item/18047/Inkscape-09960d6-x86_64.AppImage
	chmod +x $(PWD)/Inkscape.AppImage
