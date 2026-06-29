{ mkImage, pkgs, lib, ... }:

# loki-canary - standalone Grafana Loki data-integrity canary
# https://github.com/grafana/loki
# Note: "-fips" suffix refers to the build variant; this packages the
# upstream loki-canary binary and makes no FIPS compliance claim.

let
  version = "3.7.3";

  drv = pkgs.stdenv.mkDerivation {
    pname = "loki-canary";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/grafana/loki/releases/download/v${version}/loki-canary-linux-amd64.zip";
      hash = "sha256:1plra6673xq8nc98lgkr4wkq46shxinf023l66830v9hs7v9kq9s";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.unzip ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 loki-canary-linux-amd64 $out/bin/loki-canary
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "loki-canary-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/loki-canary" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "loki-canary";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
