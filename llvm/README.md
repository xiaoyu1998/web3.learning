## build llvm
```
1.git clone git@github.com:llvm/llvm-project.git --recursive  
2.cd llvm-project
3.git checkout llvmorg-14.0.3
4.cmake -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" ../llvm
5.make
```

## build&execute kaleidoscope
```
6.git clone git@github.com:TheDan64/inkwell.git --recursive 
7.cd inkwell
6.LLVM_SYS_140_PREFIX=/to/path/llvm-project/build cargo build --features llvm14-0 --example kaleidoscope
7../target/debug/kaleidoscope --dc --dp --dl
```