set(VCPKG_BUILD_TYPE release) # Header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/sys_string
    REF "v${VERSION}"
    SHA512 2f8e8518111bd18ca528b3f4e49f0fe73f11ddc7823afe0b6145bfc3dbe9036bff9cd97d0d9dd0228aad6b51260e1f134780ea08b24e5b766afe5140911acafc
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/lib"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME sys_string)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
