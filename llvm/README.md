## build llvm
```
$ git clone git@github.com:llvm/llvm-project.git --recursive  
$ cd llvm-project
$ git checkout llvmorg-14.0.3
$ cmake -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" ../llvm
$ make
```

## build&execute kaleidoscope
```
$ git clone git@github.com:TheDan64/inkwell.git --recursive 
$ cd inkwell
$ LLVM_SYS_140_PREFIX=/to/path/llvm-project/build cargo build --features llvm14-0 --example kaleidoscope
$ ./target/debug/kaleidoscope --dc --dp --dl
```