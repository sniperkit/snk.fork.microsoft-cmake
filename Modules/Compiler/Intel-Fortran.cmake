# Sniperkit-Bot
# - Status: analyzed

include(Compiler/Intel)
__compiler_intel(Fortran)

set(CMAKE_Fortran_MODDIR_FLAG "-module ")
set(CMAKE_Fortran_FORMAT_FIXED_FLAG "-fixed")
set(CMAKE_Fortran_FORMAT_FREE_FLAG "-free")

set(CMAKE_Fortran_CREATE_PREPROCESSED_SOURCE "<CMAKE_Fortran_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -E <SOURCE> > <PREPROCESSED_SOURCE>")
set(CMAKE_Fortran_CREATE_ASSEMBLY_SOURCE "<CMAKE_Fortran_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -S <SOURCE> -o <ASSEMBLY_SOURCE>")

set(CMAKE_Fortran_PREPROCESS_SOURCE
  "<CMAKE_Fortran_COMPILER> -fpp <DEFINES> <INCLUDES> <FLAGS> -E <SOURCE> > <PREPROCESSED_SOURCE>")
