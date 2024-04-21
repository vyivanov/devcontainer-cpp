FROM debian:bookworm
ARG username

RUN \
  apt update \
&& \
  apt install --yes --no-install-recommends \
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
    libcpprest-dev  \
    libfmt-dev      \
    lldb            \
    ltrace          \
    mypy            \
    ninja-build     \
    pipenv          \
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
  wget https://ollama.ai/download/ollama-linux-amd64 \
    -O /usr/local/bin/ollama && chmod +x /usr/local/bin/ollama \
  # TODO: [maybe] Start 'ollama serve' as daemon.
&& \
  useradd --create-home --shell /bin/bash --uid 1000 ${username}

# TODO: Add tests on provisioned environment.
USER ${username}
WORKDIR /workspace
