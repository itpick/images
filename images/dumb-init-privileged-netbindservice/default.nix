{ mkImage, pkgs, lib, ... }:

# dumb-init - a simple process supervisor and init system for containers
# https://github.com/Yelp/dumb-init
# Upstream ships a prebuilt static linux x86_64 binary release.

let
  version = "1.2.5";

  drv = pkgs.stdenv.mkDerivation {
    pname = "dumb-init";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/Yelp/dumb-init/releases/download/v${version}/dumb-init_${version}_x86_64";
      hash = "sha256-6HS1XzJ5ykFBXSkMUSp7qdCPmAQbKK58KssZpUXxxN8=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/dumb-init
      runHook postInstall
    '';

    meta = with lib; {
      description = "Simple process supervisor and init system for containers";
      homepage = "https://github.com/Yelp/dumb-init";
      license = licenses.mit;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "dumb-init-privileged-netbindservice";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/dumb-init" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dumb-init-privileged-netbindservice";
    "org.opencontainers.image.description" = "Simple process supervisor and init system for containers";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
