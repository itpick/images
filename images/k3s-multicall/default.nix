{ mkImage, pkgs, lib, ... }:

# k3s - lightweight Kubernetes (k3s-io/k3s)
# https://github.com/k3s-io/k3s
# Upstream prebuilt linux x86_64 release binary (single static multicall binary:
# embeds kubectl, crictl, ctr, etc.).

let
  version = "1.36.2+k3s1";
  releaseTag = "v1.36.2+k3s1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "k3s";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/k3s-io/k3s/releases/download/v1.36.2%2Bk3s1/k3s";
      hash = "sha256-ZaVexWwk6rRDgwhhZuxiCkkZUrfiOUGkndym6KTEtN4=";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/k3s
      runHook postInstall
    '';

    meta = with lib; {
      description = "Lightweight Kubernetes (multicall binary)";
      homepage = "https://github.com/k3s-io/k3s";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "k3s-multicall";
  tag = "v1.36.2-k3s1";
  entrypoint = [ "${drv}/bin/k3s" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "k3s-multicall";
    "org.opencontainers.image.description" = "Lightweight Kubernetes (multicall binary)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
