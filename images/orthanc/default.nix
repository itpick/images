{ mkImage, pkgs, lib, ... }:

# Orthanc - DICOM server for medical imaging
# https://www.orthanc-server.com/

mkImage {
  drv = pkgs.orthanc;
  name = "orthanc";
  tag = "v${pkgs.orthanc.version}";
  entrypoint = [ "${pkgs.orthanc}/bin/Orthanc" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Orthanc";
    "org.opencontainers.image.description" = "DICOM server for medical imaging";
    "org.opencontainers.image.version" = pkgs.orthanc.version;
  };
}
