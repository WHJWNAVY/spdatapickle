cmake_minimum_required (VERSION 3.3.2)

project (spxml
    LANGUAGES CXX
    VERSION "1.0.0"
)

set(CMAKE_CXX_STANDARD 11)
set(PROJECT_LIB_NAME spxml)
set(CMAKE_BUILD_TYPE Release)

configure_file(
  "${PROJECT_NAME}.pc.in"
  "${PROJECT_NAME}.pc"
  @ONLY)

find_package(PkgConfig REQUIRED)

file(GLOB LIBSPXML_SRCS ./spcanonxml.cpp
                        ./spdomiterator.cpp
                        ./spdomparser.cpp
                        ./spxmlcodec.cpp
                        ./spxmlevent.cpp
                        ./spxmlhandle.cpp
                        ./spxmlnode.cpp
                        ./spxmlparser.cpp
                        ./spxmlreader.cpp
                        ./spxmlstag.cpp
                        ./spxmlutils.cpp
                        # ./testdom.cpp
                        # ./testhandle.cpp
                        # ./testpull.cpp
                        # ./testxmlconf.cpp
                        )

FILE(GLOB_RECURSE LIBSPXML_HEADERS *.hpp)

FILE(GLOB_RECURSE LIBSPXML_PKGCFG ./*.pc ./*/*.pc)

# add_library(${PROJECT_LIB_NAME} SHARED ${LIBSPXML_SRCS})
add_library(${PROJECT_LIB_NAME} STATIC ${LIBSPXML_SRCS})

target_include_directories(${PROJECT_LIB_NAME} PUBLIC ${PROJECT_SOURCE_DIR})

install(FILES ${LIBSPXML_HEADERS}
    DESTINATION include/${PROJECT_LIB_NAME}
)

install(TARGETS ${PROJECT_LIB_NAME}
    ARCHIVE DESTINATION lib # for static lib
    LIBRARY DESTINATION lib # for shared lib
)

install(FILES ${LIBSPXML_PKGCFG}
        DESTINATION lib/pkgconfig)
