
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/ptl
    REF "v${VERSION}"
    SHA512 f5e6a082d15b25fcbc68588bd4b58cf0498f5c124ea4da6082440e2e875ae67bf32cc89f59c9abeacd3e5099aea38e11729c10ad39d6b54f9a4798532d6bf4e4
    HEAD_REF master
    PATCHES "${CMAKE_CURRENT_LIST_DIR}/patch1.patch"
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS 
        "-DPTL_NO_TESTS=ON"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/ptl PACKAGE_NAME ptl)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)


file(REMOVE_RECURSE 
    "${CURRENT_PACKAGES_DIR}/debug" 
    "${CURRENT_PACKAGES_DIR}/lib")
