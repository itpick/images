{ mkImage, pkgs, lib, ... }:

# BusyBox - "The Swiss Army Knife of Embedded Linux"
# Upstream prebuilt static (musl) x86_64 binary from busybox.net
# https://busybox.net/downloads/binaries/

let
  version = "1.35.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "busybox-full";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://busybox.net/downloads/binaries/${version}-x86_64-linux-musl/busybox";
      hash = "sha256:0j0k66x8p1gv6hz8v7mrh99i698ab10qjkgrn7lw3a0269zkw4kf";
    };

    # Single static binary, not an archive.
    dontUnpack = true;

    # Static musl binary - autoPatchelfHook is a harmless no-op.
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    dontStrip = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/busybox
      runHook postInstall
    '';
  };

in mkImage {
  inherit drv;
  name = "busybox-full";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/busybox" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "busybox-full";
    "org.opencontainers.image.description" = "The Swiss Army Knife of Embedded Linux (full static build)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
