Configuration of 'imagemagick' with features:
  
 - libpng
 - libjpeg
 - libtiff
 - libwebp
 - freetype
 - lzma
 - libxml2 (needed for svg support)
 - libfftw3

Magick++ library is sensitive to compiler, but dependencies are not. 
Compiled imagemagick with msys + rtools, while linking against msys2 C libraries.
See build.sh script.

Patches were merged upstream in imagemagick-6.9.5-3. 

Flag "-pthread" is needed only for the old gcc-4.6.3 toolchain.

The configure script didn't seem to support "-m64" properly so I ended up compiling
the gcc-4.6.3 x64 library with gcc-4.6.4-release-posix-sjlj-rev0 instead.
