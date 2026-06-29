{ mkImage, pkgs, lib, ... }:

# buildkitd - concurrent, cache-efficient, and Dockerfile-agnostic builder daemon
# Upstream prebuilt release binary from https://github.com/moby/buildkit
# Note: the "-fips" suffix denotes the same upstream tool; no FIPS claim is made.

let
  version = "0.31.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "buildkitd-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/moby/buildkit/releases/download/v${version}/buildkit-v${version}.linux-amd64.tar.gz";
      hash = "sha256:0vp1a5s4cgl2azipkkg8754vs1v83mahng4sg4cdqsy9s188giqz";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [
      pkgs.stdenv.cc.cc.lib
      pkgs.zlib
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -Dm755 bin/* -t $out/bin
      runHook postInstall
    '';
  };

in mkImage {
  inherit drv;
  name = "buildkitd-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/buildkitd" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "buildkitd-fips";
    "org.opencontainers.image.description" = "BuildKit builder daemon (moby/buildkit upstream binary)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
