{ mkImage, pkgs, lib, ... }:

# Logstash - Server-side data processing pipeline
# https://www.elastic.co/logstash
#
# nixpkgs.logstash is pinned to the 7.17 line, whose bundled Java deps
# (jackson/log4j/netty/…) carry critical CVEs. Package the current 9.x
# distribution (which ships its own JDK) directly from Elastic.

let
  version = "9.4.3";

  logstash = pkgs.stdenv.mkDerivation {
    pname = "logstash";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://artifacts.elastic.co/downloads/logstash/logstash-${version}-linux-x86_64.tar.gz";
      hash = "sha256-D/beWoHk3Fn+8TIRvUmms7V2ma7UZ0M5CNFN/XF+v7A=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.makeWrapper ];
    # The bundled JDK + native libs link against these; anything else the
    # JDK dlopens is resolved at runtime.
    buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.zlib ];
    autoPatchelfIgnoreMissingDeps = true;

    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      runHook preInstall
      mkdir -p "$out/opt/logstash" "$out/bin"
      cp -r . "$out/opt/logstash"
      # bin/logstash locates and uses the bundled jdk/ automatically.
      makeWrapper "$out/opt/logstash/bin/logstash" "$out/bin/logstash"
      runHook postInstall
    '';

    meta.mainProgram = "logstash";
  };

in
mkImage {
  drv = logstash;
  name = "logstash";
  tag = "v${version}";
  entrypoint = [ "${logstash}/bin/logstash" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert bash coreutils ];

  labels = {
    "org.opencontainers.image.title" = "Logstash";
    "org.opencontainers.image.description" = "Server-side data processing pipeline for ingesting data";
    "org.opencontainers.image.version" = version;
  };
}
