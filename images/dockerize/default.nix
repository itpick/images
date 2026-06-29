{ mkImage, pkgs, lib, ... }:

# dockerize - utility to simplify running apps in containers
# https://github.com/jwilder/dockerize

let
  version = "0.13.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "dockerize";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/jwilder/dockerize/releases/download/v${version}/dockerize-linux-amd64-v${version}.tar.gz";
      hash = "sha256-P5sBzB6w3vgR/Z3psvrvfrMRW1F4W6aQvr8UehXkzao=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 dockerize $out/bin/dockerize
      runHook postInstall
    '';

    meta = with lib; {
      description = "Utility to simplify running applications in Docker containers";
      homepage = "https://github.com/jwilder/dockerize";
      license = licenses.mit;
      platforms = [ "x86_64-linux" ];
    };
  };
in mkImage {
  inherit drv;
  name = "dockerize";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/dockerize" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "dockerize";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
