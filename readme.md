# ImageMagick 6

Stack build from July 28, 2017. The glib2 related packages are compiled from 
source (using [rtools32](rtools32.sh) / [rtools64](rtools64.sh) because they
require special macros for static linking. 

 - imagemagick 6.9.9.3
 - librsvg 2.40.18
 - cairo 1.15.6
 - pango 1.40.6
 - glib2 2.52.3
 - gdk-pixbuf2 2.36.6
 - harfbuzz (--without-graphite2) 1.4.6

Also everything was built without introspection bindings. To build use e.g.

```
source rtools64
makepkg-mingw --skippgpcheck
```

Other packages were taken from msys2 binaries:

 - freetype 2.8
 - bzip2 1.0.6
 - lcms2 2.8
 - libpng 1.6.30
 - libtiff 4.0.8
 - fftw 3.3.6-pl2
 - zlib 1.2.11

For some reason drawing, expecially text, is still very slow on Windows. Perhaps
there is an issue with font finding. I have disabled fontconfig in imagemagick
but it is still used by cairo and pango.
