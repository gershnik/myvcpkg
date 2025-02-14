This is a [vcpkg](https://vcpkg.io/en/) registry for all the C++ libraries
I have published on Github.

To add it to your configuration add this to the `registries` field in your `vcpkg-configuration.json`

```
"registries": [
  ...
  {
    "kind": "git",
    "reference": "master",
    "repository": "https://github.com/gershnik/myvcpkg",
    "baseline": "0aba408c1a580b10c9c1de9bc3bd48b7cc80abf4",
    "packages": [ 
        "library name 1", 
        "library name 2", 
        ...
    ]
  }
]
```

Where available library names are:

<br><table width="100%">
    <thead>
      <tr>
        <th width="20%">Name</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>["argum"](https://github.com/gershnik/argum)</td>
        <td>Fully-featured, powerful, command line argument parser in C++20.</td>
      </tr>
      <tr>
        <td>["isptr"](https://github.com/gershnik/intrusive_shared_ptr)</td>
        <td>Intrusive reference counting smart pointer, highly configurable reference counted base class and various adapters.</td>
      </tr>
      <tr>
        <td>["libuuid"](https://github.com/gershnik/libuuid-cmake)</th>
        <td>Universally unique id library from util-linux.</td>
      </tr>
      <tr>
        <td>["modern-uuid"](https://github.com/gershnik/modern-uuid)</td>
        <td>A modern, no-dependencies, portable C++ library for manipulating UUIDs. Fully supports RFC 9562 and RFC 4122.</td>
      </tr>
      <tr>
        <td>["objc-helpers"](https://github.com/gershnik/objc-helpers)</td>
        <td>Utilities to make coding on Apple platforms in C++ or ObjectiveC++ more pleasant.</td>
      </tr>
      <tr>
        <td>["ptl"](https://github.com/gershnik/ptl)</td>
        <td>C++ library for Posix and related calls.</td>
      </tr>
      <tr>
        <td>["sys-string"](https://github.com/gershnik/sys_string)</td>
        <td>A family of C++ string classes optimized for interoperability with platform-native string types.</td>
      </tr>
      <tr>
        <td>["thinsqlitepp"](https://github.com/gershnik/thinsqlitepp)</td>
        <td>A thin, safe and convenient C++ wrapper for SQLite API.</td>
      </tr>
    </tbody>
</table>

