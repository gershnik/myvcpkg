
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/objc-helpers
    REF "v${VERSION}"
    SHA512 47101bbc1353fe0acf007f9c3a0208e54bca87f2bd68e266e7c1bc9b2f676daf31fac030cd94cb688422229bceed74139604dac15ffc24f56dcc4334976fbfcf
    HEAD_REF master
)

file(COPY "${SOURCE_PATH}/include" DESTINATION "${CURRENT_PACKAGES_DIR}")


vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
