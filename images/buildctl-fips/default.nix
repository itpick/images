{ mkImage, pkgs, lib, ... }:

# buildctl - BuildKit client CLI (from moby/buildkit)
# https://github.com/moby/buildkit
let
  version = "0.31.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "buildctl";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/moby/buildkit/releases/download/v${version}/buildkit-v${version}.linux-amd64.tar.gz";
      hash = "sha256-H8eHUNDJa9wYeZo8C1UdaAe9STnozXnjV4I+RnRR4W4=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 bin/buildctl $out/bin/buildctl
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "buildctl-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/buildctl" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "buildctl";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
