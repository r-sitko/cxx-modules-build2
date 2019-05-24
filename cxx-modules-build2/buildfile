import libs = libstd-modules%liba{std-modules}

exe{main}: {hxx ixx txx mxx cxx}{*} $libs

cxx.poptions =+ "-I$out_root" "-I$src_root"
