FROM circleci/android:api-28-alpha

ENV NODEJS_VERSION=11.0.0 \
    PATH=$PATH:/home/circleci/node/bin

RUN mkdir -p /home/circleci/node
WORKDIR "/home/circleci/node"

RUN sudo apt-get update && sudo apt-get install -y curl git ca-certificates --no-install-recommends && \
    curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1 -C /home/circleci/node && \
    sudo rm -rf /var/lib/apt/lists/* && \
    sudo apt-get clean
