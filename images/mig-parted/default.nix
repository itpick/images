{ mkImage, pkgs, lib, ... }:

# NVIDIA MIG Partition Editor (nvidia-mig-parted)
# https://github.com/NVIDIA/mig-parted
# Packaged from the upstream nvidia-mig-manager release tarball.

let
  version = "0.14.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "mig-parted";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/NVIDIA/mig-parted/releases/download/v${version}/nvidia-mig-manager-${version}-1.x86_64.tar.gz";
      hash = "sha256:10xl27brc2701kznpyc1pksqfp7xqc4gv4gnnmn32dxd2yxpdrx3";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "nvidia-mig-manager-${version}-1";

    installPhase = ''
      runHook preInstall
      install -Dm755 nvidia-mig-parted $out/bin/nvidia-mig-parted
      runHook postInstall
    '';

    meta = with lib; {
      description = "NVIDIA MIG Partition Editor";
      homepage = "https://github.com/NVIDIA/mig-parted";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };
in mkImage {
  inherit drv;
  name = "mig-parted";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/nvidia-mig-parted" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "mig-parted";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
