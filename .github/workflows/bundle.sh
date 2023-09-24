#/bin/sh
set -e
PACKAGE=imagemagick

# Update
pacman -Syy --noconfirm
OUTPUT=$(mktemp -d)

# Download files (-dd skips dependencies)
pkgs=$(echo mingw-w64-{i686,x86_64,ucrt-x86_64}-{$PACKAGE,libjpeg-turbo,pcre})
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
  echo "Extracting: $URL"
  echo " - $FILE" >> README.md
  tar xf $FILE -C ${OUTPUT}
  rm -f $FILE
done

# Remove stuff we don't need
rm -Rf ${OUTPUT}/*/lib/{gettext,pkgconfig,cmake}
#rm -fv ${OUTPUT}/*/lib/lib{asprintf,charset,iconv,intl,gettext*,gnurx,hogweed,ssl,tre,systre}.a

# Put into dir structure
rm -Rf lib lib-8.3.0 include
mkdir -p lib lib-8.3.0 include
cp -Rf ${OUTPUT}/mingw64/lib lib-8.3.0/x64
cp -Rf ${OUTPUT}/mingw32/lib lib-8.3.0/i386
cp -Rf ${OUTPUT}/ucrt64/lib/*.a lib/
ls -ltrRh .

# Imagemagick config files
cp -Rf ${OUTPUT}/mingw64/include/ImageMagick-6 include/
rm -f include/ImageMagick-6/magick/magick-baseconfig.h
mkdir -p include-config/{x64,i386}/magick
cp -f ${OUTPUT}/ucrt64/include/ImageMagick-6/magick/magick-baseconfig.h include-config/x64/magick/
cp -f ${OUTPUT}/mingw32/include/ImageMagick-6/magick/magick-baseconfig.h include-config/i386/magick/

# HACK to make linker flags in R package consistent with future releases
cp lib-8.3.0/x64/libpcre.a lib-8.3.0/x64/libpcre2-8.a
cp lib-8.3.0/i386/libpcre.a lib-8.3.0/i386/libpcre2-8.a
cp lib/libpcre.a lib/libpcre2-8.a

# Cleanup
rm -Rf ${OUTPUT}
