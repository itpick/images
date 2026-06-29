{ mkImage, pkgs, lib, ... }:

# dapr-placement-fips - Dapr actor placement control-plane service.
# Packages the upstream Dapr placement binary. No FIPS claim is made here.
# https://github.com/dapr/dapr

let
  version = "1.18.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "dapr-placement";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/dapr/dapr/releases/download/v${version}/placement_linux_amd64.tar.gz";
      hash = "sha256:1fjld8ypx2fdg174km6vad589zd6xw5y01546k1mp3wy2qly41ad";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";
    dontStrip = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 placement $out/bin/placement
      runHook postInstall
    '';
  };

in mkImage {
  inherit drv;
  name = "dapr-placement-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/placement" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "dapr-placement-fips";
    "org.opencontainers.image.description" = "Dapr actor placement service";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
