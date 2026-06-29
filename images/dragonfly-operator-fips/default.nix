{ mkImage, pkgs, lib, ... }:

# Dragonfly Operator - Kubernetes operator for Dragonfly
# https://github.com/dragonflydb/dragonfly-operator
# Upstream publishes a prebuilt linux x86_64 binary asset per release.

let
  version = "1.6.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "dragonfly-operator";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/dragonflydb/dragonfly-operator/releases/download/v${version}/dragonfly-operator";
      hash = "sha256-lDQjzL/ukCMyltNiaeGbtZqFOY6vpCPD7d11lBuphXQ=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/dragonfly-operator
      runHook postInstall
    '';

    meta = with lib; {
      description = "Kubernetes operator for Dragonfly";
      homepage = "https://github.com/dragonflydb/dragonfly-operator";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "dragonfly-operator-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/dragonfly-operator" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dragonfly-operator-fips";
    "org.opencontainers.image.description" = "Kubernetes operator for Dragonfly";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
