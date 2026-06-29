{ mkImage, pkgs, lib, ... }:

# Omni - Sidero Omni: manage Kubernetes clusters across bare metal, VMs, and cloud
# https://github.com/siderolabs/omni

let
  version = "1.9.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "omni";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/siderolabs/omni/releases/download/v${version}/omni-linux-amd64";
      hash = "sha256-6BZdcOFOgscvIdzGNSmXuDaBA7a8ymXO6Cv5NvdL8K8=";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/omni
      runHook postInstall
    '';

    meta = with lib; {
      description = "Sidero Omni - manage Kubernetes clusters across bare metal, VMs, and cloud";
      homepage = "https://github.com/siderolabs/omni";
      license = licenses.bsl11;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "omni";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/omni" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "omni";
    "org.opencontainers.image.description" = "Sidero Omni - Kubernetes management plane";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
