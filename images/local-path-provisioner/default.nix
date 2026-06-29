{ mkImage, pkgs, lib, ... }:

# Rancher local-path-provisioner - dynamic local PV provisioner for Kubernetes
# https://github.com/rancher/local-path-provisioner
# Note: v0.0.26 is the last release shipping standalone prebuilt binaries;
# newer releases publish container images only.

let
  version = "0.0.26";

  drv = pkgs.stdenv.mkDerivation {
    pname = "local-path-provisioner";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/rancher/local-path-provisioner/releases/download/v${version}/local-path-provisioner-amd64";
      hash = "sha256:08wmjm5ai0dxib1lhr65kda394cr1jh0l7xilinb23lsy8flr6dr";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/local-path-provisioner
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "local-path-provisioner";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/local-path-provisioner" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "local-path-provisioner";
    "org.opencontainers.image.description" = "Rancher dynamic local path provisioner for Kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
