# Using patched imagemagick sources from msys2
# Link against dependency C libs from msys2
export PKG_CONFIG="/c/msys2-i686/mingw32/bin/pkg-config"
export PKG_CONFIG_PATH="/c/msys2-i686/mingw32/lib/pkgconfig"
export CPPFLAGS="-m32 -I/c/msys2-i686/mingw32/include -DLIBXML_STATIC -DGLIB_STATIC_COMPILATION"
export CFLAGS="-m32 -I/c/msys2-i686/mingw32/include -DLIBXML_STATIC -DGLIB_STATIC_COMPILATION"
export CXXLAGS="-m32 -I/c/msys2-i686/mingw32/include -DLIBXML_STATIC -DGLIB_STATIC_COMPILATION"
export LDFLAGS="-m32 -L/c/msys2-i686/mingw32/lib"
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
    --without-lqr \
    --without-fontconfig \
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
    --disable-hdri
