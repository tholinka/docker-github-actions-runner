#!/bin/bash -x
GH_RUNNER_VERSION=$1
TARGETPLATFORM=$2

export TARGET_ARCH="x64"
if [[ $TARGETPLATFORM == "linux/arm/v7" ]]; then
  export TARGET_ARCH="arm"
elif [[ $TARGETPLATFORM == "linux/arm64" ]]; then
  export TARGET_ARCH="arm64"
fi
curl -o actions.tar.gz -L "https://github.com/actions/runner/releases/download/v${GH_RUNNER_VERSION}/actions-runner-linux-${TARGET_ARCH}-${GH_RUNNER_VERSION}.tar.gz"
tar xf actions.tar.gz
rm -f actions.tar.gz
./bin/installdependencies.sh
mkdir /_work
