{ mkImage, pkgs, lib, ... }:

# nats-box - NATS utility box; its primary tool is the `nats` CLI (natscli)
# https://github.com/nats-io/natscli

let
  version = "0.4.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "natscli";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/nats-io/natscli/releases/download/v${version}/nats-${version}-linux-amd64.zip";
      hash = "sha256-jb1DfIJrlT29dDLPiQ7yK6PDPczD3OXnGz6NBVQnhJw=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.unzip ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "nats-${version}-linux-amd64";

    installPhase = ''
      runHook preInstall
      install -Dm755 nats $out/bin/nats
      runHook postInstall
    '';

    meta = with lib; {
      description = "NATS command line interface (nats-box)";
      homepage = "https://github.com/nats-io/natscli";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "nats-box";
  tag = "v${version}";
  buildType = "binary";
  entrypoint = [ "${drv}/bin/nats" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nats-box";
    "org.opencontainers.image.description" = "NATS utility box (nats CLI)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
