{ mkImage, pkgs, lib, ... }:

# agentbeat - consolidated Elastic Beats binary used by Elastic Agent
# https://www.elastic.co/beats

let
  version = "9.2.4";

  drv = pkgs.stdenv.mkDerivation {
    pname = "agentbeat";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://artifacts.elastic.co/downloads/beats/agentbeat/agentbeat-${version}-linux-x86_64.tar.gz";
      hash = "sha256-BQ08r226RvOtRvMyZAjr6ZzQoQleu0622BeQ1Qt77QA=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [
      pkgs.stdenv.cc.cc.lib
      pkgs.zlib
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      srcdir=agentbeat-${version}-linux-x86_64
      mkdir -p $out/share/agentbeat
      cp -r $srcdir/. $out/share/agentbeat/
      install -Dm755 $srcdir/agentbeat $out/bin/agentbeat
      runHook postInstall
    '';

    dontStrip = true;
  };

in mkImage {
  inherit drv;
  name = "agentbeat";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/agentbeat" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "agentbeat";
    "org.opencontainers.image.description" = "Consolidated Elastic Beats binary";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
