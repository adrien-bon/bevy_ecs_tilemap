FROM mcr.microsoft.com/devcontainers/rust:latest

# Install base packages
RUN apt update --yes \
 && apt install --yes \
    tig \
    bash-completion \
    mingw-w64 \
    g++ \
    pkg-config \
    x11-apps

# Fix git subtree sub-command
RUN ln -s /usr/lib/git-core/git-subtree /usr/local/libexec/git-core/git-subtree

# Make sure we have an up to date rustc with all its components and install Windows toolchain
ENV RUST_VERSION 1.79.0
RUN rustup update ${RUST_VERSION} \
 && rustup default ${RUST_VERSION} \
 && rustup component add cargo \
 && rustup component add clippy \
 && rustup component add rls \
 && rustup component add rust-analysis \
 && rustup component add rust-analyzer \
 && rustup component add rust-src \
 && rustup component add rustfmt \
 && rustup target add x86_64-pc-windows-gnu

# Prepare git config
RUN git config --system core.editor "code --wait" \
 && git config --system diff.tool vscode \
 && git config --system difftool.vscode.cmd "code --wait --diff \$LOCAL \$REMOTE" \
 && git config --system merge.tool vscode \
 && git config --system mergetool.vscode.cmd "code --wait \$MERGED" \
 && git config --system user.email '63343541+adrien-bon@users.noreply.github.com' \
 && git config --system user.name 'Adrien Bon'

# Extra stuff should go in extras.sh
ADD extras.sh /extras.sh
RUN /extras.sh && rm -f /extras.sh
