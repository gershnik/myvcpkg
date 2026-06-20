
vcpkg_download_distfile(
    UTIL_LINUX_ARCHIVE 
    URLS https://github.com/util-linux/util-linux/archive/v${VERSION}.tar.gz
    FILENAME libuuid-${VERSION}.tar.gz
    SHA512 45bc1e2beda3cff8eba03b3c84588087052e53f594c8e2b2afda46fecf67855783feeed08953a607314c7845b1a35966f0fdb1cd668bcc41a3cf00e2f6fe8300
)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/libuuid-cmake
    REF "v${VERSION}"
    SHA512 657782c0be0c3fc2d5c61c0ae0119ab9f0e58afde329188a76ba5abb24da38ef3059b606402760b36a3afe0317a26e7e07044e898519d6d90724c51d0b8beb4f
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
