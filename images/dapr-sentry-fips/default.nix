{ mkImage, pkgs, lib, ... }:

# dapr-sentry-fips - Dapr sentry certificate-authority control-plane service.
# Packages the upstream Dapr sentry binary. No FIPS claim is made here.
# https://github.com/dapr/dapr

let
  version = "1.18.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "dapr-sentry";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/dapr/dapr/releases/download/v${version}/sentry_linux_amd64.tar.gz";
      hash = "sha256:133y10zn15r30pq0vslph764684nq893x9qhzk58lq45khny53m7";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";
    dontStrip = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 sentry $out/bin/sentry
      runHook postInstall
    '';
  };

in mkImage {
  inherit drv;
  name = "dapr-sentry-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/sentry" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "dapr-sentry-fips";
    "org.opencontainers.image.description" = "Dapr sentry certificate authority service";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
