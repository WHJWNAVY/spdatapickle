#!/bin/sh

TOP_DIR=$(pwd)
INSTALL_PREFIX=${TOP_DIR}/install
INSTALL_PKGINC_PATH=${INSTALL_PREFIX}/include
INSTALL_PKGLIB_PATH=${INSTALL_PREFIX}/lib
INSTALL_PKGCFG_PATH=${INSTALL_PKGLIB_PATH}/pkgconfig
export PKG_CONFIG_PATH=${INSTALL_PKGCFG_PATH}:${PKG_CONFIG_PATH}
export PKG_LIBRARY_PATH=${INSTALL_PKGLIB_PATH}

clean_target() {
    [[ -d ${INSTALL_PREFIX} ]] && rm -rf ${INSTALL_PREFIX}
    mkdir ${INSTALL_PREFIX}
}

build_target() {
    target=$1
    if [[ -f ${target}/CMakeLists.txt ]]; then
        cd ${target}
        [[ -d build ]] && rm -rf build
        [[ ! -d build ]] && mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} ../
        make && make install && cd ..
        cd ..
    fi
}

clean_target
build_target spxml
build_target spjson
build_target spdatapickle