SOURCE="https://www.edrawsoft.com/archives/mindmaster-7-amd64.deb"
DESTINATION="build.deb"
OUTPUT="MindMaster.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	
	dpkg -x $(DESTINATION) build
	rm -rf AppDir/application
	
	mkdir --parents AppDir/application
	cp -r build/opt/MindMaster-*/* AppDir/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/application
	rm -rf build
