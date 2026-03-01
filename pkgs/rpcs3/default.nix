{
  lib,
  stdenv,
  fetchurl,
  buildFHSEnv,
  makeDesktopItem,
}:

let
  rpcs3-unwrapped = stdenv.mkDerivation rec {
    pname = "rpcs3-unwrapped";
    version = "v0.0.39-18867";

    src = fetchurl {
      url = "https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-198c2e9eb835dbe95c674ad8c98138fb080f1ff4/rpcs3-${version}-198c2e9e_linux64.AppImage";
      hash = "sha256-h66lk/NWvDLjpqLxwsnNqBWm0wDc/WP9pRpoWcKdP7o=";
    };

    phases = [ "installPhase" ];

    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/rpcs3.AppImage
      chmod +x $out/bin/rpcs3.AppImage
    '';
  };
in
buildFHSEnv {
  name = "rpcs3";
  targetPkgs =
    pkgs: with pkgs; [
      fontconfig
      freetype
      libXrender
      libxcb
      libXi
      libXcursor
      libXrandr
      libXinerama
      libXfixes
      libxkbcommon
      wayland
      nspr
      nss
      cups
      at-spi2-atk
      pango
      cairo
      zlib
      libglvnd
      vulkan-loader
      alsa-lib
      libx11
      e2fsprogs
      gmp
      libgpg-error
      xcb-util-cursor
    ];
  runScript = "${rpcs3-unwrapped}/bin/rpcs3.AppImage --appimage-extract-and-run";
}
