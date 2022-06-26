FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  apt update && \
  apt upgrade -y && \
  apt install -y automake cmake curl g++ gettext git libtool-bin make pkg-config unzip && \
  git clone -b stable --single-branch --depth 1 https://github.com/neovim/neovim.git

WORKDIR neovim

ADD nvim-appimage-appimagetool.patch nvim-appimage-appimagetool.patch

RUN \
  patch -p1 <nvim-appimage-appimagetool.patch && \
  make appimage
