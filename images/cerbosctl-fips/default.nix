{ mkImage, pkgs, lib, ... }:

# cerbosctl - command-line interface for Cerbos
# https://github.com/cerbos/cerbos
let
  version = "0.53.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "cerbosctl";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/cerbos/cerbos/releases/download/v${version}/cerbosctl_${version}_Linux_x86_64.tar.gz";
      hash = "sha256-HHel8kULMoKIwfisR6tnz4My+qhJdPFTyqwynY1EDtE=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 cerbosctl $out/bin/cerbosctl
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "cerbosctl-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/cerbosctl" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cerbosctl-fips";
    "org.opencontainers.image.description" = "Cerbos command-line interface";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
