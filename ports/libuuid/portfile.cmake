
vcpkg_download_distfile(
    UTIL_LINUX_ARCHIVE 
    URLS https://github.com/util-linux/util-linux/archive/v${VERSION}.tar.gz
    FILENAME libuuid.tar.gz
    SHA512 8e4ea997a9c1978c7bc1b0125b4bb5ab2d26e1eb1cb6a4134a09633af827f19d849d941bc2031af23310c8e5adb8446e487cb13414170b7f502f675dc8d67c12
)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/libuuid-cmake
    REF "v${VERSION}.rev1"
    SHA512 5ceef1d7bf1f744adeba585e3fee5cfa99bef4af54d0250300b991455743c82884ed0befaa75a51e0080f816ac9292b947932007e1a5c08ca50b5fb4d29dc453
    HEAD_REF master
)

vcpkg_extract_source_archive(
    UTIL_LINUX_DIR
    ARCHIVE "${UTIL_LINUX_ARCHIVE}"
    BASE_DIRECTORY util_linux
)

vcpkg_apply_patches(
    SOURCE_PATH "${UTIL_LINUX_DIR}/libuuid"
    PATCHES "${SOURCE_PATH}/patches/patch_2.40.diff"
)


vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS 
        "-DFETCHCONTENT_SOURCE_DIR_UTIL-LINUX=${UTIL_LINUX_DIR}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/uuid PACKAGE_NAME uuid)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

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
