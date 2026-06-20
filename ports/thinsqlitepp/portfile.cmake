set(VCPKG_BUILD_TYPE release) # Header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/thinsqlitepp
    REF "v${VERSION}"
    SHA512 9107348229b7aa1f4c171f8d22048b15de39613ee05b13e33d6600b61cf285b06786e61dd72398ffc66485d33dbbc0f2389c0ed534610d50003bb08210e29791
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/lib"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME thinsqlitepp)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
