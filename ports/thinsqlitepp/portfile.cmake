set(VCPKG_BUILD_TYPE release) # Header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/thinsqlitepp
    REF "v${VERSION}"
    SHA512 38f44007337ae2825adcde9f75cc758ef1faf6a8018a2a67ef53d02b4f3a318e5776e7ca67b0a07421a8873f9b0b3dd00b34c01fd8d8e7d8eb9c511dcf8e8bb9
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/lib"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/thinsqlitepp PACKAGE_NAME thinsqlitepp)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")
