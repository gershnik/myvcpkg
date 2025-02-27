
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gershnik/objc-helpers
    REF "v${VERSION}"
    SHA512 4db87363f6f12f4f07be049116edafbff4181ef99bb8259a5dcba84b309b13bec4ee465c0d2cc50dd715846df37d558f7c68339fc7d1fcbf1e760ee0660a0fb3
    HEAD_REF master
)

file(COPY "${SOURCE_PATH}/include" DESTINATION "${CURRENT_PACKAGES_DIR}")


vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
