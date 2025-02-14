This is a [vcpkg](https://vcpkg.io/en/) registry for all the C++ libraries
I have published on Github.

To add it to your configuration add this to the `registries` field in your `vcpkg-configuration.json`

```json
"registries": [
  ...
  {
    "kind": "git",
    "reference": "master",
    "repository": "https://github.com/gershnik/myvcpkg",
    "baseline": "43681f58084d2d9f8d0e9dbdcfc6b06a3bc3d54c",
    "packages": [ 
        "library name 1", 
        "library name 2", 
        ...
    ]
  }
]
```

Where available library names are:

|                   Name                                                  |   Description 
|-------------------------------------------------------------------------|----------------------------------
|<nobr>["argum"](https://github.com/gershnik/argum)</nobr>                | Fully-featured, powerful, command line argument parser in C++20.
|<nobr>["isptr"](https://github.com/gershnik/intrusive_shared_ptr)</nobr> | Intrusive reference counting smart pointer, highly configurable reference counted base class and various adapters.
|<nobr>["libuuid"](https://github.com/gershnik/libuuid-cmake)</nobr>      | Universally unique id library from util-linux.
|<nobr>["modern-uuid"](https://github.com/gershnik/modern-uuid)</nobr>    | A modern, no-dependencies, portable C++ library for manipulating UUIDs. Fully supports RFC 9562 and RFC 4122.
|<nobr>["objc-helpers"](https://github.com/gershnik/objc-helpers)</nobr>  | Utilities to make coding on Apple platforms in C++ or ObjectiveC++ more pleasant.
|<nobr>["ptl"](https://github.com/gershnik/ptl)</nobr>                    | C++ library for Posix and related calls.
|<nobr>["sys-string"](https://github.com/gershnik/sys_string)</nobr>      | A family of C++ string classes optimized for interoperability with platform-native string types.
|<nobr>["thinsqlitepp"](https://github.com/gershnik/thinsqlitepp)</nobr>  | A thin, safe and convenient C++ wrapper for SQLite API.

