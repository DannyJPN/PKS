#!/bin/bash 
echo "-DBUILD_TEST_APP:BOOL=ON -DBUILD_TEST_RT_ANY:BOOL=ON -DBUILD_DBG_MONITOR:BOOL=ON -DBUILD_DBG_RT:BOOL=ON -DBUILD_TESTING:BOOL=OFF -DCMAKE_BUILD_TYPE:STRING=Debug -DDEFAULT_CONF_PATH:PATH=/root/conf/freeDiameter">/root/conf/freeDiameter/CMakeFlags
# Install dependencies for freeDiameter
apt install flex bison libsctp* libgcrypt* libgcrypt*  libgnutls*  mercurial cmake gdb python-dev swig libidn* g++ gcc make

# Install the link to the configuration
#/home/aaa/installvm.sh conflink

mkdir -p /home/aaa/src/
cd /home/aaa/src/
wget http://www.freediameter.net/hg/freeDiameter/archive/1.5.0.tar.gz
tar -xavf 1.5.0.tar.gz
mv  mv freeDiameter-1.5.0 freeDiameter

#Test CMake flags file
if ! [ -f /root/conf/freeDiameter/CMakeFlags ]; then echo Missing flags file; exit 1; fi

# Build freeDiameter
rm -rf /root/freeDiameter
mkdir /root/freeDiameter
pushd /root/freeDiameter
cd /root/freeDiameter
cmake `cat /root/conf/freeDiameter/CMakeFlags` /home/aaa/src/freeDiameter
popd
cd /root/freeDiameter
make
make install

