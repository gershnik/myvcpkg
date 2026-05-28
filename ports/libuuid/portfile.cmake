
vcpkg_download_distfile(
    UTIL_LINUX_ARCHIVE 
    URLS https://github.com/util-linux/util-linux/archive/v${VERSION}.tar.gz
    FILENAME libuuid-${VERSION}.tar.gz
    SHA512 4846fea35fb10204a9a018a4e26994c9c5f4746e0c15fe0002aee1f2449d97be3b3fe432c6cdf3b10416eb9372488d2d4e5ac63927b086b3cd6e2dd18e56d169
)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/libuuid-cmake
    REF "v${VERSION}"
    SHA512 c92b203f493197977d76c578b9687f63e3c83dc76a4eb454fb4722a9507587f98d7a780bfa2ddd43bbe40b7cb9159edd2ac09cf67434527a00c1414499511e0c
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
