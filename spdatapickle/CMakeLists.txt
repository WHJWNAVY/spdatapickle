cmake_minimum_required (VERSION 3.3.2)

project (spdatapickle
    LANGUAGES CXX
    VERSION "1.0.0"
)

set(CMAKE_CXX_STANDARD 11)
set(PROJECT_EXE_NAME spxml2struct)
set(CMAKE_BUILD_TYPE Release)

set(PROJECT_LD_PATH $ENV{PKG_LIBRARY_PATH})

find_package(PkgConfig REQUIRED)
pkg_search_module(LIBSPXML REQUIRED spxml)
pkg_search_module(LIBSPJSON REQUIRED spjson)
pkg_check_modules(LIBSPXML REQUIRED spxml)
pkg_check_modules(LIBSPJSON REQUIRED spjson)

file(GLOB SPDATAPICKLE_SRCS ./spdatapickle.cpp
                        ./spdpalloc.cpp
                        ./spdpbase64.cpp
                        ./spdpcode.cpp
                        ./spdpmetainfo.cpp
                        ./spdpmetautils.cpp
                        ./spdpname.cpp
                        ./spdpsyntax.cpp
                        ./spdpxml.cpp
                        ./spjsonpickle.cpp
                        ./sppbpickle.cpp
                        ./spxml2struct.cpp
                        ./spxmlpickle.cpp
                        # ./testaddrbook.cpp
                        )

link_directories(${PROJECT_LD_PATH})

add_executable(${PROJECT_EXE_NAME} ${SPDATAPICKLE_SRCS}) 

target_link_libraries(${PROJECT_EXE_NAME} ${LIBSPXML_LIBRARIES}
                                          ${LIBSPJSON_LIBRARIES})

target_include_directories(${PROJECT_EXE_NAME} PUBLIC ${PROJECT_SOURCE_DIR}
                                                      ${LIBSPXML_INCLUDE_DIRS}
                                                      ${LIBSPJSON_INCLUDE_DIRS})

install(TARGETS ${PROJECT_EXE_NAME} RUNTIME DESTINATION bin)
