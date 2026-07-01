{ mkImage, pkgs, lib, ... }:

# Zipkin - Distributed tracing system
# https://zipkin.io/
#
# nixpkgs.zipkin is pinned to an ancient 1.28.1 (2019) whose fat jar bundles
# long-EOL jackson/tomcat/log4j with dozens of criticals. Package the current
# upstream exec jar (Maven Central) directly instead.

let
  version = "3.6.1";

  zipkinJar = pkgs.fetchurl {
    url = "https://repo1.maven.org/maven2/io/zipkin/zipkin-server/${version}/zipkin-server-${version}-exec.jar";
    hash = "sha256-2DJuDtT0OFXbqBIo9ohVRwblJXinx4LZqQtz+GgGVKE=";
  };

  zipkin = pkgs.runCommand "zipkin-${version}"
    {
      nativeBuildInputs = [ pkgs.makeWrapper ];
      meta.mainProgram = "zipkin-server";
    } ''
    mkdir -p $out/share/java $out/bin
    cp ${zipkinJar} $out/share/java/zipkin-server.jar
    # Root-level zipkin.jar for the `java -jar` entrypoint below.
    ln -s share/java/zipkin-server.jar $out/zipkin.jar
    makeWrapper ${pkgs.openjdk21_headless}/bin/java $out/bin/zipkin-server \
      --add-flags "-jar $out/share/java/zipkin-server.jar"
  '';

in
mkImage {
  drv = zipkin;
  name = "zipkin-slim";
  tag = "v${version}";
  entrypoint = [ (lib.getExe zipkin) ];
  cmd = [ ];

  extraPkgs = with pkgs; [ openjdk21_headless cacert ];

  labels = {
    "org.opencontainers.image.title" = "zipkin-slim";
    "org.opencontainers.image.description" = "zipkin-slim container image";
    "org.opencontainers.image.version" = version;
  };
}
