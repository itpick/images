{ mkImage, pkgs, lib, ... }:

# ctr-fips - same upstream tool as ctr (containerd's CLI client).
# Packages the upstream containerd ctr binary. No FIPS claim is made here.
# https://github.com/containerd/containerd

let
  version = "2.3.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "ctr-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/containerd/containerd/releases/download/v${version}/containerd-${version}-linux-amd64.tar.gz";
      hash = "sha256:0ym1f7zcwywncmq63msjkf6lmbrl0nk270cwzgrrbfwmcmpmwqkm";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 bin/ctr $out/bin/ctr
      runHook postInstall
    '';
  };

in mkImage {
  inherit drv;
  name = "ctr-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/ctr" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "ctr-fips";
    "org.opencontainers.image.description" = "containerd CLI client";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
