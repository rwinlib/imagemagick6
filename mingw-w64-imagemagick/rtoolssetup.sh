#!/bin/sh
PREFIX="/c/rtools40${MINGW_PREFIX}/bin"
export CPPFLAGS="-DLIBXML_STATIC -DGLIB_STATIC_COMPILATION"
#export CXXFLAGS="$CPPFLAGS"
#export CFLAGS="$CPPFLAGS"
export CC="$PREFIX/gcc $CPPFLAGS"
export CXX="$PREFIX/g++ -std=gnu++11 $CPPFLAGS"

# To use 'ar' and stuff from Rtools as well
#RBINPATH=`dirname $CC`
#RBINPATH=`cygpath $RBINPATH`
#export PATH="$RBINPATH:$PATH"
