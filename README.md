# Example application with C++ Modules Technical Specification feature

## Description

Project shows example application with C++ Modules TS feature (which will be introduced in C++20 standard). For building code it uses build2 - an open source (MIT), cross-platform build toolchain with C++ Modules TS building support.

In `cxx-modules-build2` directory there are application files with C++ code:

- `main.cpp` contains main function, module import statements and uses `math`, `std.io` and `std.core` modules
- `math.cpp` contains `math` module implementation
- `math.mpp` contains `math` module interface

## Prerequisites

### Prerequisites for running application using Docker

- [Docker](https://www.docker.com)

### Prerequisites for running application without using Docker

- [build2](https://build2.org)
- [Clang with C++ Modules TS feature](https://clang.llvm.org)

## Running application

### Running application using Docker

Being in root directory of project run in terminal:

```bash
sudo ./build_and_run.sh
```

### Running application without using Docker

Being in root directory of project run in terminal:

```bash
bdep init -C @clang cc config.cxx=clang++
b
cxx-modules-build2/main
```
