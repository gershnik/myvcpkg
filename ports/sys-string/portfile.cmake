set(VCPKG_BUILD_TYPE release) # Header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/sys_string
    REF "v${VERSION}"
    SHA512 1dfe2ea1bf50e51fcd2eb7dc3d2ff3bb4564e3010d07f40a1aac671d3d826c79dd6ee57abb8ea93e9b0ca62c2f377a517c980a5c93eaff59588c6b90cf3ba08c
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/lib"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/sys_string PACKAGE_NAME sys_string)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")
