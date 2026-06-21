set(VCPKG_BUILD_TYPE release) # Header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/objc-helpers
    REF "v${VERSION}"
    SHA512 e8bbd111d7bccf84423288d8d08759ae03b2c49549a4170cb9cfbe5575476d280730f479ea8bb31f5ffaf244dd02b0cb4d3357551113116a982646fd40f1a81e
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS 
        ""
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME objc-helpers)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
