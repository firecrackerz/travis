#!/bin/bash

apt-get -q update 
apt-get -q install -y make libc6-dev clang-3.9 curl libedit-dev libpython2.7 libicu-dev libssl-dev libxml2 tzdata git libcurl4-openssl-dev  pkg-config


DIR="$(pwd)"
	cd ..
	export SWIFT_PLATFORM=ubuntu18.04
    export SWIFT_BRANCH=development
    export SWIFT_VERSION=swift-DEVELOPMENT-SNAPSHOT-2019-06-02-a

    # wget https://swift.org/builds/swift-3.1.1-release/ubuntu1404/${SWIFT_VERSION}/${SWIFT_VERSION}-ubuntu14.04.tar.gz
	# tar xzf $SWIFT_VERSION-ubuntu14.04.tar.gz
	# export PATH="${PWD}/${SWIFT_VERSION}-ubuntu14.04/usr/bin:${PATH}"
    # Download GPG keys, signature and Swift package, then unpack, cleanup and execute permissions for foundation libs
    SWIFT_URL=https://swift.org/builds/$SWIFT_BRANCH/$(echo "$SWIFT_PLATFORM" | tr -d .)/$SWIFT_VERSION/$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz \
    && curl -fSsL $SWIFT_URL -o swift.tar.gz \
    && export GNUPGHOME="$(mktemp -d)" \
    && tar -xzf swift.tar.gz --directory / --strip-components=1 \
    && rm -r "$GNUPGHOME" swift.tar.gz \
    && chmod -R o+r /usr/lib/swift
	cd "$DIR"