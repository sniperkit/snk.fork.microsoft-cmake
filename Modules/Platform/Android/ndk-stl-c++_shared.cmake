# Sniperkit-Bot
# - Status: analyzed

include(Platform/Android/ndk-stl-c++)
macro(__android_stl lang)
  __android_stl_cxx(${lang} libc++_shared.so)
  __android_stl_lib(${lang} "${CMAKE_ANDROID_NDK}/sources/cxx-stl/llvm-libc++/libs/${CMAKE_ANDROID_ARCH_ABI}/libandroid_support.a" 0)
endmacro()
