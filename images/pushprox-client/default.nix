{ mkImage, pkgs, lib, ... }:

# pushprox-client - PushProx client run alongside scrape targets behind NAT/firewalls
# https://github.com/prometheus-community/PushProx

let
  version = "0.2.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "pushprox-client";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/prometheus-community/PushProx/releases/download/v${version}/PushProx-${version}.linux-amd64.tar.gz";
      hash = "sha256-x1zAXQeNWVcbi9plYDlYTcS3vpX8irUzK/q7AsLIBqM=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "PushProx-${version}.linux-amd64";

    installPhase = ''
      runHook preInstall
      install -Dm755 pushprox-client $out/bin/pushprox-client
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "pushprox-client";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pushprox-client" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "pushprox-client";
    "org.opencontainers.image.description" = "PushProx client run alongside Prometheus scrape targets behind NAT/firewalls";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
