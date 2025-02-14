
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/argum
    REF "v${VERSION}"
    SHA512 f8cfccf4f031a0158ec7311fc3fafb22b9e2aec0f910f53d4805f9f863885d2c3f842788d84620efecc2d1e9cbf79801a34863809643f3e311ac3e38296907b6
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS 
        "-DARGUM_NO_TESTS=ON"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/argum PACKAGE_NAME argum)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)


file(REMOVE_RECURSE 
    "${CURRENT_PACKAGES_DIR}/debug" 
    "${CURRENT_PACKAGES_DIR}/lib")
