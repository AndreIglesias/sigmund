#!/usr/bin/env bash

declare -a dependencies=(
    [0]=openjdk-18-jre
    [1]=wget
    [2]=curl
    [3]=zip
    [4]=protobuf-compiler
    [5]=clang
    [6]=libclang-dev
    [7]=cmake
    [8]=make
)

install_libsignal()
{
    # Install libsignal
    mkdir -p /tmp/libsignal-install && cd /tmp/libsignal-install
    export LIBVERSION=$(find /opt/signal-cli-"${VERSION}"/lib/ \
			     -maxdepth 1 \
			     -mindepth 1 \
			     -name 'libsignal-client-*' \
			    | sed -E 's/\/opt\/signal-.*libsignal-client-//g' \
			    | sed -E 's/.jar//g')
    
    echo "LIBVERSION=${LIBVERSION}"
    wget https://github.com/signalapp/libsignal/archive/refs/tags/v"${LIBVERSION}".tar.gz
    tar xzf /tmp/libsignal-install/v"${LIBVERSION}".tar.gz -C /tmp/libsignal-install/
    mv /tmp/libsignal-install/libsignal-"${LIBVERSION}" libsignal
    rm -v /tmp/libsignal-install/v"${LIBVERSION}".tar.gz
    
    cd libsignal/java
    sed -i "s/include ':android'//" /tmp/libsignal-install/libsignal/java/settings.gradle
    /tmp/libsignal-install/libsignal/java/build_jni.sh desktop
    
    zip -d /opt/signal-cli-${VERSION}/lib/libsignal-client-*.jar libsignal_jni.so
    zip /opt/signal-cli-${VERSION}/lib/libsignal-client-*.jar /tmp/libsignal-install/libsignal/target/release/libsignal_jni.so

    mkdir -p /usr/java/packages/lib
    cp -v /tmp/libsignal-install/libsignal/target/release/libsignal_jni.so /usr/java/packages/lib
    cd / && rm -rf /tmp/libsignal-install

    
    ## Permissions
    chown root:root /usr/java/packages/lib/libsignal_jni.so
    chmod 755 /usr/java/packages/lib/libsignal_jni.so
    chmod 755 -R /opt/signal-cli-${VERSION}
    chown root:root -R /opt/signal-cli-${VERSION}
}

config_sigcli()
{
    echo "SIGNAL-CLI-VERSION=${VERSION}"
    # Install signal-cli
    wget https://github.com/AsamK/signal-cli/releases/download/v"${VERSION}"/signal-cli-"${VERSION}"-Linux.tar.gz

    ## Un-compress and link
    tar xf signal-cli-"${VERSION}"-Linux.tar.gz -C /opt
    rm -v signal-cli-"${VERSION}"-Linux.tar.gz
    ln -sf /opt/signal-cli-"${VERSION}"/bin/signal-cli /usr/local/bin/
    ln -s /opt/signal-cli-"${VERSION}" /opt/signal-cli
    
    ls -l /usr/local/bin/signal-cli /opt/signal-cli
}

install_deps()
{    
    apt-get update && apt-get -y --no-install-recommends install "${dependencies[@]}"
    rm -rf /var/lib/apt/lists/*
    # Install rust
    curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly-aarch64-unknown-linux-gnu -y
    export PATH=$PATH:$HOME/.cargo/bin   
}

########## main ##########

install_deps
config_sigcli
if [ "$(lscpu | awk '/Architecture:/{print $2}')" == "aarch64" ]; then
    install_libsignal
fi

# Verify version
#signal-cli -a ${ACCOUNT} register
