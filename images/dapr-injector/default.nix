{ mkImage, pkgs, lib, ... }:

# Dapr sidecar injector
# https://github.com/dapr/dapr

let
  version = "1.18.1";

  injector = pkgs.stdenv.mkDerivation rec {
    pname = "dapr-injector";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/dapr/dapr/releases/download/v${version}/injector_linux_amd64.tar.gz";
      hash = "sha256-KQP8PoEuGwama3GEEdfGb5SwUvlob1FGV5aIyVtF6yw=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -m755 injector $out/bin/injector
      runHook postInstall
    '';

    meta = with lib; {
      description = "Dapr sidecar injector";
      homepage = "https://github.com/dapr/dapr";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  drv = injector;
  name = "dapr-injector";
  tag = "v${version}";
  entrypoint = [ "${injector}/bin/injector" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dapr-injector";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
