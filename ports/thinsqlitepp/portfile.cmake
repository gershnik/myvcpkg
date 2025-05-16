set(VCPKG_BUILD_TYPE release) # Header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/thinsqlitepp
    REF "v${VERSION}"
    SHA512 74f555e432806482843dfb954da68e7133f5e5cddc2c57d4bd599d780e1ef71f50d9c45b6a1b4202b0f8b5ab235cff8858559bb761bd5c8d090f8e2a07b532f8
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/lib"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/thinsqlitepp PACKAGE_NAME thinsqlitepp)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")
