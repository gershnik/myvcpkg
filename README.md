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
    "baseline": "a0fece6b2ddf3b77f075d2166beb5ca6cf56ef3f",
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
        <td>Fully-featured, powerful and simple-to-use C++ command-line argument parser.</td>
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
        <td>A modern, no-dependencies, portable C++ library for manipulating UUIDs, ULIDs, NanoIDs and Cuid2s.</td>
      </tr>
      <tr>
        <td>["objc-helpers"](https://github.com/gershnik/objc-helpers)</td>
        <td>Utilities to make coding on Apple platforms in C++ or ObjectiveC++ more pleasant.</td>
      </tr>
      <tr>
        <td>["ptl"](https://github.com/gershnik/ptl)</td>
        <td>A C++ library wrapping Unix system APIs.</td>
      </tr>
      <tr>
        <td>["smjni"](https://github.com/gershnik/SimpleJNI)</td>
        <td>A powerful lightweight C++ wrapper for JNI.</td>
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

