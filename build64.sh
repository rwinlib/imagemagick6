# Using patched imagemagick sources from msys2
# Link against dependency C libs from msys2
export PKG_CONFIG="/c/msys2-x64/mingw64/bin/pkg-config"
export PKG_CONFIG_PATH="/c/msys2-x64/mingw64/lib/pkgconfig"
export CPPFLAGS="-m64 -I/c/msys2-x64/mingw64/include -DLIBXML_STATIC -DGLIB_STATIC_COMPILATION"
export CFLAGS="-m64 -I/c/msys2-x64/mingw64/include -DLIBXML_STATIC -DGLIB_STATIC_COMPILATION"
export CXXLAGS="-m64 -I/c/msys2-x64/mingw64/include -DLIBXML_STATIC -DGLIB_STATIC_COMPILATION"
export LDFLAGS="-m64 -L/c/msys2-x64/mingw64/lib"
export LIBS="-lOleAut32 -pthread -lws2_32"
  ../ImageMagick-6.9.5-4/configure \
    --enable-zero-configuration \
    --enable-silent-rules \
    --disable-shared \
    --enable-static \
    --enable-opencl \
    --with-magick-plus-plus \
    --with-rsvg \
    --with-webp \
    --with-zlib \
    --with-pango \
    --with-xml \
    --with-freetype \
    --with-lzma \
    --with-png \
    --with-fftw \
    --with-gslib \
    --with-lcms \
    --without-fontconfig \
    --without-lqr \
    --without-wmf \
    --without-openexr \
    --without-openjp2 \
    --without-gvc \
    --without-raqm \
    --without-djvu \
    --without-jbig \
    --without-modules \
    --without-perl \
    --without-x \
    --without-threads \
    --disable-deprecated \
    --disable-dependency-tracking \
    --disable-legacy-support \
    --disable-hdri \
    --with-windows-font-dir=c:/Windows/fonts
