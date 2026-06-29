{ mkImage, pkgs, lib, ... }:

# AZNFS mount helper for Azure Blob NFS / Azure Files NFS
# https://github.com/Azure/AZNFS-mount

let
  version = "2.0.12";

  drv = pkgs.stdenv.mkDerivation {
    pname = "aznfs-mount";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/Azure/AZNFS-mount/releases/download/${version}/aznfs-${version}-1.x86_64.tar.gz";
      hash = "sha256-W08JNvOZf5SpA/zo/k48OuN4AXZOUiJ+ZLcIW04wXXI=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 sbin/mount.aznfs $out/bin/mount.aznfs
      install -Dm755 usr/sbin/aznfswatchdog $out/bin/aznfswatchdog
      mkdir -p $out/opt/microsoft/aznfs
      cp opt/microsoft/aznfs/*.sh $out/opt/microsoft/aznfs/
      chmod +x $out/opt/microsoft/aznfs/*.sh
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "aznfs-mount";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/mount.aznfs" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "aznfs-mount";
    "org.opencontainers.image.description" = "AZNFS mount helper for Azure NFS endpoints";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
