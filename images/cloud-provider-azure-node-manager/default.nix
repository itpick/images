{ mkImage, pkgs, lib, ... }:

# Azure cloud node manager - Kubernetes cloud-provider for Azure
# https://github.com/kubernetes-sigs/cloud-provider-azure
let
  version = "1.36.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "cloud-provider-azure-node-manager";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/kubernetes-sigs/cloud-provider-azure/releases/download/v${version}/azure-cloud-node-manager-linux-amd64";
      hash = "sha256:19yv504sfjplz8p6ch2l99pnvzd1v20ga9hg32650v2qijr44jhx";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/azure-cloud-node-manager
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "cloud-provider-azure-node-manager";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/azure-cloud-node-manager" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "cloud-provider-azure-node-manager";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
