set(VCPKG_BUILD_TYPE release) # Header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/sys_string
    REF "v${VERSION}"
    SHA512 e1aa4bc2e28a805bab3e09ceef7d26aef9302e7162b845ee28e2caa5da77152d02286cef30b1ae6ec49996b06552759acf3bc23dde4746e5588497ee00c2e43d
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
