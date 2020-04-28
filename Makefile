SOURCE="https://inkscape.org/gallery/item/18047/Inkscape-09960d6-x86_64.AppImage"
DESTINATION="Inkscape.AppImage"

all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)
	chmod +x $(DESTINATION)
