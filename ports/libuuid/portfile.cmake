
vcpkg_download_distfile(
    UTIL_LINUX_ARCHIVE 
    URLS https://github.com/util-linux/util-linux/archive/v${VERSION}.tar.gz
    FILENAME libuuid-${VERSION}.tar.gz
    SHA512 806d633eec52ec11c44a591edf9d496f6f7588c10243522d5cbb8d903e05ad8d512e79ad8a4c1076b17bcf50ecbc715c5ad9f51c920029964f22aa1eaaffee3f
)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/libuuid-cmake
    REF "v${VERSION}"
    SHA512 b7e274426d9c9442affbe605cbc8e5128051d1689ffcfd61bc9a71eba69007ccf89cc0c1ac1359167b3fa398b9e7a5b37e800d2a7901295310b9be7004e084ee
    HEAD_REF master
)

vcpkg_extract_source_archive(
    UTIL_LINUX_DIR
    ARCHIVE "${UTIL_LINUX_ARCHIVE}"
    BASE_DIRECTORY util_linux
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS 
        "-DFETCHCONTENT_SOURCE_DIR_UTIL-LINUX=${UTIL_LINUX_DIR}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/uuid PACKAGE_NAME uuid)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/lib/pkgconfig")
file(COPY "${CURRENT_PACKAGES_DIR}/share/pkgconfig/uuid.pc" DESTINATION "${CURRENT_PACKAGES_DIR}/lib/pkgconfig")
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig")
file(COPY "${CURRENT_PACKAGES_DIR}/share/pkgconfig/uuid.pc" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/pkgconfig")

vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE 
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_copy_pdbs()
