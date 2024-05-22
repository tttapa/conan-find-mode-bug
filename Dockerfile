FROM python:3.12-bookworm

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update -y && \
    apt-get install --no-install-recommends -y cmake make && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
RUN pip install conan==2.3.1
RUN conan profile detect -f

WORKDIR /test-conan
COPY conanfile.txt CMakeLists.txt toolchain.cmake ./
COPY find_root ./find_root
COPY sysroot ./sysroot
ENTRYPOINT [ "/usr/bin/bash" ]

# rm -rf build
# cmake -B build -S . --toolchain toolchain.cmake
# rm -rf build
# conan install . -c tools.cmake.cmaketoolchain:user_toolchain="[\"$PWD/toolchain.cmake\"]" -c tools.build.cross_building:cross_build=true
# cmake --preset conan-release
