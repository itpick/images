{ mkImage, pkgs, lib, ... }:

# containerd-stress (fips variant) - stress testing tool shipped in the containerd release tarball
# https://github.com/containerd/containerd
# Note: packages the upstream containerd-stress binary; no FIPS certification claimed.

let
  version = "2.3.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "containerd-stress-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/containerd/containerd/releases/download/v${version}/containerd-${version}-linux-amd64.tar.gz";
      hash = "sha256-dWJeb2WVu5Xz+5yBI6YFNK9KjZtS12FwZZZ7zv5xoXo=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 bin/containerd-stress $out/bin/containerd-stress
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "containerd-stress-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/containerd-stress" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "containerd-stress-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
