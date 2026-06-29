{ mkImage, pkgs, lib, ... }:

# Argo Events controller (argo-events-fips variant) - upstream prebuilt release binary
# https://github.com/argoproj/argo-events
# The -fips suffix is an upstream naming variant; this packages the upstream argo-events binary.

let
  version = "1.9.10";

  drv = pkgs.stdenv.mkDerivation {
    pname = "argo-events";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/argoproj/argo-events/releases/download/v${version}/argo-events-linux-amd64.gz";
      hash = "sha256-sE0sghxpQAguVuFdC/gvKQei0G2PLK1pnDDiy1OFeLE=";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.gzip ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      gunzip -c $src > argo-events
      install -Dm755 argo-events $out/bin/argo-events
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "argo-events-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/argo-events" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "argo-events-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
