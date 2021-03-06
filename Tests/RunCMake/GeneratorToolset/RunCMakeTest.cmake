# Sniperkit-Bot
# - Status: analyzed

include(RunCMake)

set(RunCMake_GENERATOR_TOOLSET "")
run_cmake(NoToolset)

if("${RunCMake_GENERATOR}" MATCHES "Visual Studio 1[01245]")
  set(RunCMake_GENERATOR_TOOLSET "Test Toolset")
  run_cmake(TestToolset)
  set(RunCMake_GENERATOR_TOOLSET "Test Toolset,cuda=Test Cuda")
  run_cmake(TestToolsetCudaBoth)
  set(RunCMake_GENERATOR_TOOLSET ",cuda=Test Cuda")
  run_cmake(TestToolsetCudaOnly)
  set(RunCMake_GENERATOR_TOOLSET "cuda=Test Cuda")
  run_cmake(TestToolsetCudaOnly)
  if("${RunCMake_GENERATOR}" MATCHES "Visual Studio 1[245]")
    set(RunCMake_GENERATOR_TOOLSET "Test Toolset,host=x64")
    run_cmake(TestToolsetHostArchBoth)
    set(RunCMake_GENERATOR_TOOLSET ",host=x64")
    run_cmake(TestToolsetHostArchOnly)
    set(RunCMake_GENERATOR_TOOLSET "host=x64")
    run_cmake(TestToolsetHostArchOnly)
    set(RunCMake_GENERATOR_TOOLSET "Test Toolset")
    run_cmake(TestToolsetHostArchNone)
    set(RunCMake_GENERATOR_TOOLSET "Test Toolset,host=x65")
    run_cmake(BadToolsetHostArch)
    set(RunCMake_GENERATOR_TOOLSET "Test Toolset,host=x64,host=x64")
    run_cmake(BadToolsetHostArchTwice)
  else()
    set(RunCMake_GENERATOR_TOOLSET "Test Toolset,host=x64")
    run_cmake(BadToolsetHostArch)
  endif()
  set(RunCMake_GENERATOR_TOOLSET "Test Toolset,not_a_key")
  run_cmake(BadToolsetFormat)
elseif("${RunCMake_GENERATOR}" STREQUAL "Xcode")
  set(RunCMake_GENERATOR_TOOLSET "Test Toolset")
  run_cmake(TestToolset)
  set(RunCMake_GENERATOR_TOOLSET "Test Toolset,host=x64")
  run_cmake(BadToolsetHostArchXcode)
else()
  set(RunCMake_GENERATOR_TOOLSET "Bad Toolset")
  run_cmake(BadToolset)
endif()

set(RunCMake_GENERATOR_TOOLSET "")

set(RunCMake_TEST_OPTIONS -T "Extra Toolset")
run_cmake(TwoToolsets)
unset(RunCMake_TEST_OPTIONS)

if("${RunCMake_GENERATOR}" MATCHES "Visual Studio 1[01245]|Xcode")
  set(RunCMake_TEST_OPTIONS -DCMAKE_TOOLCHAIN_FILE=${RunCMake_SOURCE_DIR}/TestToolset-toolchain.cmake)
  run_cmake(TestToolsetToolchain)
  unset(RunCMake_TEST_OPTIONS)
else()
  set(RunCMake_TEST_OPTIONS -DCMAKE_TOOLCHAIN_FILE=${RunCMake_SOURCE_DIR}/BadToolset-toolchain.cmake)
  run_cmake(BadToolsetToolchain)
  unset(RunCMake_TEST_OPTIONS)
endif()
