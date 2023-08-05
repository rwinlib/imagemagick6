#/bin/sh
set -e
PACKAGE=imagemagick

# Update
pacman -Sy
OUTPUT=$(mktemp -d)

# Download files (-dd skips dependencies)
pkgs=$(echo mingw-w64-{i686,x86_64,ucrt-x86_64}-${PACKAGE})
deps=$(pacman -Si $pkgs | grep 'Depends On' | grep -o 'mingw-w64-[_.a-z0-9-]*')
URLS=$(pacman -Sp $pkgs $deps --cache=$OUTPUT)
VERSION=$(pacman -Si mingw-w64-x86_64-${PACKAGE} | awk '/^Version/{print $3}')

# Set version for next step
echo "::set-output name=VERSION::${VERSION}"
echo "::set-output name=PACKAGE::${PACKAGE}"
echo "Bundling $PACKAGE-$VERSION"
echo "# $PACKAGE $VERSION" > README.md
echo "" >> README.md

for URL in $URLS; do
  curl -OLs $URL
  FILE=$(basename $URL)
  echo "Extracting: $FILE"
  echo " - $FILE" >> readme.md
  tar xf $FILE -C ${OUTPUT}
  unlink $FILE
done
rm -Rf lib lib-8.3.0 lib-4.9.3 include include-4.9.3 include-config mingw-w64-imagemagick config.status
mkdir -p lib-8.3.0/{x64,i386} lib/x64 include
cp -Rf ${OUTPUT}/mingw64/include/ImageMagick-6 include/
cp -Rf ${OUTPUT}/mingw64/lib/*.a lib-8.3.0/x64/
cp -Rf ${OUTPUT}/mingw32/lib/*.a lib-8.3.0/i386/
cp -Rf ${OUTPUT}/ucrt64/lib/*.a lib/x64/
ls -ltrRh .

# Imagemagick config files
rm -f include/ImageMagick-6/magick/magick-baseconfig.h
mkdir -p include-config/{x64,i386}/magick
cp -f ${OUTPUT}/ucrt64/include/ImageMagick-6/magick/magick-baseconfig.h include-config/x64/magick/
cp -f ${OUTPUT}/mingw32/include/ImageMagick-6/magick/magick-baseconfig.h include-config/i386/magick/
