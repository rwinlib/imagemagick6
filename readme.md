Configuration of 'imagemagick' similar to the homebrew one:
  
 - libpng
 - libjpeg
 - libtiff
 - freetype
 - lzma
 - libxml2 (needed for svg support)

Magick++ library is sensitive to compiler, but dependencies are not. 
Compiled imagemagick with msys + rtools, while linking against msys2 C libraries.
See build.sh script.

Patches are merged upstream in imagemagick-6.9.5-3. 

Note that "-pthread" is needed only for the old gcc-4.6.3 toolchain.

The configure script didn't seem to support "-m64" properly so I ended up compiling
the gcc-4.6.3 x64 library with gcc-4.6.4-release-posix-sjlj-rev0 instead.
