# Install script for directory: /home/cranesoar/LibQPEP

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/../lib" TYPE STATIC_LIBRARY FILES "/home/cranesoar/LibQPEP/build/libLibQPEP.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/LibQPEP" TYPE FILE FILES
    "/home/cranesoar/LibQPEP/generateProjectedPoints.h"
    "/home/cranesoar/LibQPEP/pnp_WQD.h"
    "/home/cranesoar/LibQPEP/solver_WQ_1_2_3_4_5_9_13_17_33_49_approx.h"
    "/home/cranesoar/LibQPEP/solver_WQ_1_2_3_4_5_9_13_17_33_49_approx_helper.h"
    "/home/cranesoar/LibQPEP/QPEP_grobner.h"
    "/home/cranesoar/LibQPEP/utils.h"
    "/home/cranesoar/LibQPEP/misc_pnp_funcs.h"
    "/home/cranesoar/LibQPEP/QPEP_lm_single.h"
    "/home/cranesoar/LibQPEP/pTop_WQD.h"
    "/home/cranesoar/LibQPEP/misc_pTop_funcs.h"
    "/home/cranesoar/LibQPEP/solver_WQ_approx_helper.h"
    "/home/cranesoar/LibQPEP/solver_WQ_approx.h"
    "/home/cranesoar/LibQPEP/QPEP.h"
    "/home/cranesoar/LibQPEP/solver_WQ.h"
    "/home/cranesoar/LibQPEP/solver_WQ_helper.h"
    "/home/cranesoar/LibQPEP/CVLib.h"
    "/home/cranesoar/LibQPEP/CovEstimation.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/LibQPEP/cmake/LibQPEP-config.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/LibQPEP/cmake/LibQPEP-config.cmake"
         "/home/cranesoar/LibQPEP/build/CMakeFiles/Export/share/LibQPEP/cmake/LibQPEP-config.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/LibQPEP/cmake/LibQPEP-config-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/LibQPEP/cmake/LibQPEP-config.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/LibQPEP/cmake" TYPE FILE FILES "/home/cranesoar/LibQPEP/build/CMakeFiles/Export/share/LibQPEP/cmake/LibQPEP-config.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/LibQPEP/cmake" TYPE FILE FILES "/home/cranesoar/LibQPEP/build/CMakeFiles/Export/share/LibQPEP/cmake/LibQPEP-config-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/LibQPEP/cmake" TYPE FILE FILES "/home/cranesoar/LibQPEP/build/CMakeFiles/LibQPEPConfig.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/cranesoar/LibQPEP/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
