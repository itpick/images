{ mkImage, pkgs, lib, ... }:

# helm-set-status - Helm plugin to set the status of a release
# https://github.com/josegonzalez/helm-set-status
let
  version = "0.2.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "helm-set-status";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/josegonzalez/helm-set-status/releases/download/v${version}/helm-set-status_${version}_linux_amd64.tar.gz";
      hash = "sha256:0pkm8qlhppwylf9384mjjc1ibz333rr7adwm4khqwrqgldgnkc7j";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 helm-set-status $out/bin/helm-set-status
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "helm-set-status";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/helm-set-status" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "helm-set-status";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
