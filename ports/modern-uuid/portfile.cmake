
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/modern-uuid
    REF "v${VERSION}"
    SHA512 2686f61f4054eb8d4753c702a0321fc61b6dc9f47714a4d1133aebd4e2065bdfc626cddcdbed91f5edc6de339b366125514b44634897618e49f6ec4f4aa0e94d
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS 
        "-DMUUID_NO_TESTS=ON"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/modern-uuid PACKAGE_NAME modern-uuid)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/lib/pkgconfig")
file(COPY "${CURRENT_PACKAGES_DIR}/share/pkgconfig/modern-uuid.pc" DESTINATION "${CURRENT_PACKAGES_DIR}/lib/pkgconfig")
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig")
file(COPY "${CURRENT_PACKAGES_DIR}/share/pkgconfig/modern-uuid.pc" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/pkgconfig")

vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE 
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_copy_pdbs()
