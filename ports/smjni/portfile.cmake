
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/SimpleJNI
    REF "${VERSION}"
    SHA512 676c994025f30c385792b4d9d4d8328af38cddd6c6b7cac7113a0786f1f03dcdadd7e138efe9d77e23236dd14921dcbf457891a9c7daf38d866c62ebcc43c3a1
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/smjni PACKAGE_NAME smjni)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/lib/pkgconfig")
file(COPY "${CURRENT_PACKAGES_DIR}/share/pkgconfig/smjni.pc" DESTINATION "${CURRENT_PACKAGES_DIR}/lib/pkgconfig")
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig")
file(COPY "${CURRENT_PACKAGES_DIR}/share/pkgconfig/smjni.pc" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/pkgconfig")

vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE 
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_copy_pdbs()
