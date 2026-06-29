{ mkImage, pkgs, lib, ... }:

# Smallstep step CLI - https://github.com/smallstep/cli
let
  version = "0.30.6";
  drv = pkgs.stdenv.mkDerivation {
    pname = "step";
    inherit version;
    src = pkgs.fetchurl {
      url = "https://github.com/smallstep/cli/releases/download/v${version}/step_linux_${version}_amd64.tar.gz";
      hash = "sha256:1phnb16ksi8qvvghy5skw1pbrc41kak42a8g9ar999l0z32msjp4";
    };
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];
    sourceRoot = "step_${version}";
    installPhase = ''
      runHook preInstall
      install -Dm755 bin/step $out/bin/step
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "step-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/step" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "step-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
