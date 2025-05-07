We setup a Swift -> C -> Swift target dependency chain.

When generating the top-level Swift module, the ninja file expects to find a .swiftmodule file for the C module, but C targets do not product .swiftmodule files.

The imaginary swiftmodule file is referenced here:

```
build Program.exe: Swift_EXECUTABLE_LINKER__Program_ CMakeFiles/Program.dir/main.swift.obj | CModule.lib CModule.swiftmodule || CModule.dll
  FLAGS = -libc MD
  LINK_LIBRARIES = CModule.lib
  LINK_PATH = -L C:/Code/cmake-bug-repros/CTargetSwiftModule/build
  OBJECT_DIR = CMakeFiles\Program.dir
  POST_BUILD = cd .
  PRE_LINK = cd .
  TARGET_COMPILE_PDB = CMakeFiles\Program.dir\
  TARGET_FILE = Program.exe
  TARGET_IMPLIB = Program.lib
  TARGET_PDB = Program.pdb
```

And for completeness this is the compile command:

```
build CMakeFiles/Program.dir/main.swift.obj: Swift_COMPILER__Program_unscanned_ C$:/Code/cmake-bug-repros/CTargetSwiftModule/build/main.swift || cmake_object_order_depends_target_Program
  FLAGS = -module-name Program -libc MD -incremental -output-file-map CMakeFiles\Program.dir\\output-file-map.json
  INCLUDES = -I C:/Code/cmake-bug-repros/CTargetSwiftModule/include
  description = Building Swift Module 'Program' with 1 source
  restat = 1
```
