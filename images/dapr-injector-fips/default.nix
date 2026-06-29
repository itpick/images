{ mkImage, pkgs, lib, ... }:

# dapr-injector-fips - Dapr sidecar injector control-plane service.
# Packages the upstream Dapr injector binary. No FIPS claim is made here.
# https://github.com/dapr/dapr

let
  version = "1.18.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "dapr-injector";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/dapr/dapr/releases/download/v${version}/injector_linux_amd64.tar.gz";
      hash = "sha256:0b7b8mdwk24nax352vv8z59b153gqvbi313idfk0c6rfh4zgq0r9";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";
    dontStrip = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 injector $out/bin/injector
      runHook postInstall
    '';
  };

in mkImage {
  inherit drv;
  name = "dapr-injector-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/injector" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "dapr-injector-fips";
    "org.opencontainers.image.description" = "Dapr sidecar injector service";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
