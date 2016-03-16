# This assumes you've build the android toolchain, and that you want to build arm.
# This will install to /opt/arm-tools

set -x

TOOLCHAIN_PREFIX=${1:-/tmp/my-android-toolchain/bin/arm-linux-androideabi}
INSTALL_PREFIX=${2:-/opt/arm-tools}

echo "Using toolchain prefix " $TOOLCHAIN_PREFIX
export CPP=${TOOLCHAIN_PREFIX}-cpp
export AR=${TOOLCHAIN_PREFIX}-ar
export AS=${TOOLCHAIN_PREFIX}-as
export NM=${TOOLCHAIN_PREFIX}-nm
export CC=${TOOLCHAIN_PREFIX}-gcc
export CXX=${TOOLCHAIN_PREFIX}-g++
export LD=${TOOLCHAIN_PREFIX}-ld
export RANLIB=${TOOLCHAIN_PREFIX}-ranlib

./configure --with-pic --enable-shared --enable-static --host=arm-linux-androideabi --prefix=$INSTALL_PREFIX
make
make install
