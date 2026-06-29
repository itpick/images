{ mkImage, pkgs, lib, ... }:

# Grafana Pyroscope - continuous profiling platform
# https://github.com/grafana/pyroscope

let
  version = "2.1.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "grafana-pyroscope";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/grafana/pyroscope/releases/download/v${version}/pyroscope_${version}_linux_amd64.tar.gz";
      hash = "sha256:1x7z8y84plr6257kygya43syf81hv5132gvjqv3fdzj9ap03am95";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 pyroscope $out/bin/pyroscope
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "grafana-pyroscope";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pyroscope" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "grafana-pyroscope";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
