{ mkImage, pkgs, lib, ... }:

# Orthanc - DICOM server for medical imaging
# https://www.orthanc-server.com/

let
  # Orthanc runs with built-in defaults, but the default StorageDirectory /
  # IndexDirectory are relative to the read-only nix-store cwd (so it can't
  # write its SQLite index), and RemoteAccessAllowed defaults to false (only
  # localhost). Bake a minimal config at /etc/orthanc/orthanc.json (Orthanc
  # takes the config file as its positional arg): storage under the writable
  # /tmp, the REST API on :8042 + DICOM on :4242, remote access allowed with
  # authentication off so the kind-test probe can reach it. Operators mount
  # their own config (a PVC StorageDirectory, RegisteredUsers, TLS).
  orthancConfig = pkgs.writeTextDir "etc/orthanc/orthanc.json" ''
    {
      "StorageDirectory" : "/tmp/orthanc-db",
      "IndexDirectory" : "/tmp/orthanc-db",
      "HttpServerEnabled" : true,
      "HttpPort" : 8042,
      "DicomServerEnabled" : true,
      "DicomPort" : 4242,
      "RemoteAccessAllowed" : true,
      "AuthenticationEnabled" : false
    }
  '';

in
mkImage {
  drv = pkgs.orthanc;
  name = "orthanc";
  tag = "v${pkgs.orthanc.version}";
  entrypoint = [ "${pkgs.orthanc}/bin/Orthanc" ];
  # Was empty (no command). Run with the baked config; Orthanc serves the REST
  # API on 0.0.0.0:8042 and the DICOM SCP on :4242.
  cmd = [ "/etc/orthanc/orthanc.json" ];

  extraPkgs = with pkgs; [ orthancConfig ];

  labels = {
    "org.opencontainers.image.title" = "Orthanc";
    "org.opencontainers.image.description" = "DICOM server for medical imaging";
    "org.opencontainers.image.version" = pkgs.orthanc.version;
  };
}
