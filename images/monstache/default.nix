{ mkImage, pkgs, lib, ... }:

# monstache - sync daemon from MongoDB to Elasticsearch
# https://github.com/rwynn/monstache  (prebuilt Linux x86_64 release binary)

let
  version = "6.8.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "monstache";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/rwynn/monstache/releases/download/v${version}/monstache_v${version}_linux_x86_64.tar.gz";
      hash = "sha256-zGcm3HcQgCGWJyYfSi3IDp+Zv9divaXR5wMcFO2zqBQ=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 monstache $out/bin/monstache
      runHook postInstall
    '';

    meta = with lib; {
      description = "Sync daemon that keeps Elasticsearch/OpenSearch in sync with MongoDB";
      homepage = "https://github.com/rwynn/monstache";
      license = licenses.mit;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "monstache";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/monstache" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "monstache";
    "org.opencontainers.image.description" = "Sync daemon from MongoDB to Elasticsearch";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
