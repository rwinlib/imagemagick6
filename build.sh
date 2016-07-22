# Using patched imagemagick sources from msys2
# Link against dependency C libs from msys2
# Notes: https://github.com/Alexpux/MINGW-packages/issues/1534
export PKG_CONFIG_PATH="/c/msys64-x64/mingw64/lib/pkgconfig"
export CPPFLAGS="-m64 -I/c/msys64-x64/mingw64/include -DLIBXML_STATIC"
export CFLAGS="-m64 -I/c/msys64-x64/mingw64/include -DLIBXML_STATIC"
export CXXLAGS="-m64 -I/c/msys64-x64/mingw64/include -DLIBXML_STATIC"
export LDFLAGS="-m64 -L/c/msys64-x64/mingw64/lib"
  ../ImageMagick-6.9.5-3/configure \
    --enable-zero-configuration
    --disable-deprecated \
    --disable-dependency-tracking \
    --disable-silent-rules \
    --enable-shared \
    --enable-static \
    --without-modules \
    --disable-legacy-support \
    --disable-hdri \
    --with-zlib \
    --without-fontconfig \
    --with-freetype \
    --with-lzma \
    --with-png \
    --without-gvc \
    --without-raqm \
    --without-djvu \
    --without-fftw \
    --with-gslib \
    --without-lcms \
    --without-lqr \
    --without-openexr \
    --without-openjp2 \
    --without-jbig \
    --enable-opencl \
    --without-webp \
    --without-lcms \
    --without-rsvg \
    --without-perl \
    --without-pango \
    --with-xml \
    --without-x \
    --without-threads \
    --with-magick-plus-plus \
    --with-windows-font-dir=c:/Windows/fonts \
    LIBS="-lOleAut32 -pthread -lws2_32"
