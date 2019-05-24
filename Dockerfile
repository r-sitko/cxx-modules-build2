FROM ubuntu:disco

LABEL maintainer="rsitko92 <robert.sitko92@gmail.com>"

RUN apt-get update -y \
  && apt-get install --no-install-recommends -y \
  ca-certificates \
  curl \
  git \
  wget \
  gnupg \
  build-essential \
  clang \
  && rm -rf /var/lib/apt/lists/*

# install build2
RUN mkdir /home/build2-build \
  && cd /home/build2-build \
  && curl -sSfO https://download.build2.org/0.10.0/build2-install-0.10.0.sh \
  && echo "a284d98246b2d2ca8e3e3cb92af5cfeed576b2e3d214710408b70d3dc58694ea  build2-install-0.10.0.sh" | shasum -a 256 -b -c \
  && sh build2-install-0.10.0.sh \
    --yes \
    --cxx clang++ \
    --sudo false \
    --jobs $(nproc) \
    --trust "86:BA:D4:DE:2C:87:1A:EE:38:C7:F1:64:7F:65:77:02:15:79:F3:C4:83:C0:AB:5A:EA:F4:F7:8C:1D:63:30:C6"

COPY . /home/cxx-modules-build2
WORKDIR /home/cxx-modules-build2
ENTRYPOINT bdep init -C @clang cc config.cxx=clang++ \
  && b \
  && cxx-modules-build2/main