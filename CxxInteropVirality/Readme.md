To repro, run `Build.cmd`.

When `-cxx-interoperability-mode=default` is enabled on a Swift module, all dependent Swift modules must also specify the flag, even if the dependency is private, lest they get:

```
CxxInteropVirality\build\main.swift:1:8: error: module 'Library' was built with C++ interoperability enabled, but current compilation does not enable C++ interoperability
1 | import Library
  |        |- error: module 'Library' was built with C++ interoperability enabled, but current compilation does not enable C++ interoperability
  |        `- note: visit https://www.swift.org/documentation/cxx-interop/project-build-setup to learn how to enable C++ interoperability
```

See https://www.swift.org/documentation/cxx-interop/project-build-setup/ under "Vending Packages That Enable C++ Interoperability"
