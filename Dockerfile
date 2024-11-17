FROM debian:bookworm

ARG USERNAME=rename_me

RUN \
  apt-get update && apt install --yes --no-install-recommends \
    build-essential \
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
    libfmt-dev      \
    libopencv-dev   \
    lldb            \
    ltrace          \
    ninja-build     \
    python3         \
    python3-pip     \
    strace          \
    sudo            \
    tree            \
    unzip           \
    valgrind        \
    vim             \
    wget            \
    x11-apps        \
    xxd             \
 && \
    rm -rf /var/lib/apt/lists/* \
 && \
  useradd --create-home --shell /bin/bash --uid 1000 ${USERNAME} \
 && \
  echo "${USERNAME}	ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USERNAME}

# TODO: Add tests on provisioned environment.
USER ${USERNAME}
WORKDIR /workspace
