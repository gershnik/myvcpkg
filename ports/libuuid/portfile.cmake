
vcpkg_download_distfile(
    UTIL_LINUX_ARCHIVE 
    URLS https://github.com/util-linux/util-linux/archive/v${VERSION}.tar.gz
    FILENAME libuuid.tar.gz
    SHA512 b76d2a30522a5c783a3f4558cf29f9d58ddcc1ba71c34d18bf6b300250f6b35d131d9a9ea2ba04df70bea1a6311ad65d60faf21ffd57484840f5e651be991544
)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/libuuid-cmake
    REF "v${VERSION}"
    SHA512 8f395d49564bf3904743ed91cb662b093fd381303ba3f308031af8f24f955a2db29f3f75f39a692a8a72a329e87e302a9d25142114694ca9650fd45506bfb85e
    HEAD_REF master
)

vcpkg_extract_source_archive(
    UTIL_LINUX_DIR
    ARCHIVE "${UTIL_LINUX_ARCHIVE}"
    BASE_DIRECTORY util_linux
)

vcpkg_apply_patches(
    SOURCE_PATH "${UTIL_LINUX_DIR}/libuuid"
    PATCHES "${SOURCE_PATH}/patches/patch_${VERSION}.diff"
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
