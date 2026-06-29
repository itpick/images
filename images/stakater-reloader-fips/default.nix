{ mkImage, pkgs, lib, ... }:

# Stakater Reloader - https://github.com/stakater/Reloader
let
  version = "1.4.17";
  drv = pkgs.stdenv.mkDerivation {
    pname = "reloader";
    inherit version;
    src = pkgs.fetchurl {
      url = "https://github.com/stakater/Reloader/releases/download/v${version}/Reloader_v${version}_linux_amd64.tar.gz";
      hash = "sha256:1ak8aj1z8c6aybrdyapwrx22hcnsizpyn4brp9ayi01wllncxp3b";
    };
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];
    sourceRoot = ".";
    installPhase = ''
      runHook preInstall
      install -Dm755 Reloader $out/bin/reloader
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "stakater-reloader-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/reloader" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "stakater-reloader-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
