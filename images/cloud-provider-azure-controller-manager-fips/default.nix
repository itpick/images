{ mkImage, pkgs, lib, ... }:

# Azure cloud controller manager - Kubernetes cloud-provider for Azure
# https://github.com/kubernetes-sigs/cloud-provider-azure
# (-fips image variant; packages the upstream binary)
let
  version = "1.36.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "cloud-provider-azure-controller-manager-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/kubernetes-sigs/cloud-provider-azure/releases/download/v${version}/azure-cloud-controller-manager-linux-amd64";
      hash = "sha256:1k4228b01jkzih5w70gqadnjlqlp4kmr4nlccrqvivyidh2czsd3";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/azure-cloud-controller-manager
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "cloud-provider-azure-controller-manager-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/azure-cloud-controller-manager" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "cloud-provider-azure-controller-manager-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
