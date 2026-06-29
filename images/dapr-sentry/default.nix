{ mkImage, pkgs, lib, ... }:

# Dapr sentry service (mTLS certificate authority)
# https://github.com/dapr/dapr

let
  version = "1.18.1";

  sentry = pkgs.stdenv.mkDerivation rec {
    pname = "dapr-sentry";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/dapr/dapr/releases/download/v${version}/sentry_linux_amd64.tar.gz";
      hash = "sha256-p47iLZyFYIrK/BCnPhLCliBDzIGX6g3wBSOXYD8Ifow=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -m755 sentry $out/bin/sentry
      runHook postInstall
    '';

    meta = with lib; {
      description = "Dapr sentry service";
      homepage = "https://github.com/dapr/dapr";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  drv = sentry;
  name = "dapr-sentry";
  tag = "v${version}";
  entrypoint = [ "${sentry}/bin/sentry" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dapr-sentry";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
