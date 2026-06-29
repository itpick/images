{ mkImage, pkgs, lib, ... }:

# cerbosctl - command line client for Cerbos
# https://github.com/cerbos/cerbos

let
  version = "0.53.0";

  cerbosctl = pkgs.stdenv.mkDerivation rec {
    pname = "cerbosctl";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/cerbos/cerbos/releases/download/v${version}/cerbosctl_${version}_Linux_x86_64.tar.gz";
      hash = "sha256-HHel8kULMoKIwfisR6tnz4My+qhJdPFTyqwynY1EDtE=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp cerbosctl $out/bin/cerbosctl
      chmod +x $out/bin/cerbosctl
      runHook postInstall
    '';

    meta = with lib; {
      description = "Command line client for Cerbos";
      homepage = "https://github.com/cerbos/cerbos";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  drv = cerbosctl;
  name = "cerbosctl";
  tag = "v${version}";
  entrypoint = [ "${cerbosctl}/bin/cerbosctl" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cerbosctl";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
