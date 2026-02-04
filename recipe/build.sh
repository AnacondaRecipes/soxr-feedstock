 #!/bin/sh

cmake -GNinja -B build ${CMAKE_ARGS} \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_TESTS=ON \
      ${SRC_DIR}

cmake --build build --config Release
cmake --build build --config Release --target install
cd build && ctest --output-on-failure -C Release
