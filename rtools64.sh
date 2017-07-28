#!/bin/sh
RCONFIG="/c/Progra~1/R/R-3.4.1/bin/x64/R CMD config"
CXX11="`$RCONFIG CXX11`"
CXX11STD="`$RCONFIG CXX11STD`"
export LDFLAGS="-L/mingw64/lib"
export CPPFLAGS="-I/mingw64/include -DLIBXML_STATIC -DGLIB_STATIC_COMPILATION"
export CXX="$CXX11 $CXX11STD $CPPFLAGS"
export CXXCPP="`$RCONFIG CXXCPP` $CPPFLAGS"
export CXXFLAGS="`$RCONFIG CXXFLAGS`"
export CC="`$RCONFIG CC` $CPPFLAGS"
export CPP="`$RCONFIG CPP` $CPPFLAGS"
export CFLAGS="`$RCONFIG CFLAGS`"

# To use 'ar' and stuff from Rtools as well
#RBINPATH=`dirname $CC`
#RBINPATH=`cygpath $RBINPATH`
#export PATH="$RBINPATH:$PATH"
