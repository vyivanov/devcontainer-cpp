FROM debian:bookworm

ARG USERNAME=rename_me

RUN apt-get update && apt-get install --yes --no-install-recommends \
  avrdude         \
  build-essential \
  bzip2           \
  clang           \
  clangd          \
  cmake           \
  cmake-format    \
  curl            \
  ddd             \
  file            \
  gdb             \
  git             \
  git-svn         \
  less            \
  libfmt-dev      \
  libopencv-dev   \
  lldb            \
  ltrace          \
  ninja-build     \
  python3         \
  python3-pip     \
  strace          \
  sudo            \
  tar             \
  tree            \
  unzip           \
  valgrind        \
  vim             \
  wget            \
  x11-apps        \
  xxd             \
  &&              \
  rm -rf /var/lib/apt/lists/* \
  &&              \
  useradd --create-home --shell /bin/bash --uid 1000 ${USERNAME} \
  &&              \
  echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USERNAME} \
  && \
  wget --directory-prefix=/opt/ https://github.com/ZakKemble/avr-gcc-build/releases/download/v14.1.0-1/avr-gcc-14.1.0-x64-linux.tar.bz2 && \
  tar -xvjf /opt/avr-gcc-14.1.0-x64-linux.tar.bz2 -C /opt/ && \
  rm /opt/avr-gcc-14.1.0-x64-linux.tar.bz2

ENV PATH=/opt/avr-gcc-14.1.0-x64-linux/bin/:${PATH}

# TODO: Add tests on provisioned environment.
USER ${USERNAME}
WORKDIR /workspace
