Based off the [rwinlib-librsvg](https://github.com/rwinlib/rsvg) 2.40.16 bundle

```
  Shared libraries  --enable-shared=no		no
  Static libraries  --enable-static=yes		yes
  Module support    --with-modules=no		no
  GNU ld            --with-gnu-ld=yes		yes
  Quantum depth     --with-quantum-depth=16	16
  High Dynamic Range Imagery
                    --enable-hdri=no		no

 Font Configuration:
  Windows fonts     --with-windows-font-dir=c:/Windows/fonts	c:/Windows/fonts/

  X11 Configuration:
        X_CFLAGS        = 
        X_PRE_LIBS      = 
        X_LIBS          = 
        X_EXTRA_LIBS    = 

  Options used to compile and link:
    PREFIX          = /usr/local
    VERSION         = 6.9.5
    CC              = gcc -std=gnu99 -std=gnu99
    CPPFLAGS        = -m64 -I/c/msys2-x64/mingw64/include -DLIBXML_STATIC -DGLIB_STATIC_COMPILATION -DMAGICKCORE_HDRI_ENABLE=0 -DMAGICKCORE_QUANTUM_DEPTH=16 -D_LIB
    PCFLAGS         = 
    DEFS            = -DHAVE_CONFIG_H
    LDFLAGS         = -m64 -L/c/msys2-x64/mingw64/lib
    LIBS            = -lOleAut32 -pthread -lws2_32
    CXX             = g++
    CXXFLAGS        = -g -O2
    FEATURES        = DPC Zero-configuration Cipher
    DELEGATES       = bzlib mpeg fftw freetype gslib jng jpeg lcms lzma pango png ps rsvg tiff webp xml zlib                    
```

Magick++ library is sensitive to compiler but dependencies are not. 
Compiled imagemagick with msys + Rtools, while linking against msys2 
C libraries. See `build32.sh` and `build64.sh` scripts

All IM patches were merged upstream in ImageMagick 6.9.5-3. 
Patches for librsvg and dependencies are descriped in the repo above.

Flag "-pthread" is needed only for the old gcc-4.6.3 toolchain.

The configure script didn't seem to support "-m64" properly so I ended up compiling
the gcc-4.6.3 x64 library with gcc-4.6.4-release-posix-sjlj-rev0 instead.

