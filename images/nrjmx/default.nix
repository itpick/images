{ mkImage, pkgs, lib, ... }:

# nrjmx - New Relic JMX fetcher (JMX -> JSON bridge for the Infrastructure agent)
# https://github.com/newrelic/nrjmx
# Upstream ships a noarch (Java) tarball; we install the jar and wrap it with a JRE.

let
  version = "2.12.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "nrjmx";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/newrelic/nrjmx/releases/download/v${version}/nrjmx_linux_${version}_noarch.tar.gz";
      hash = "sha256-AnXinmYAkxtqQ/GoT6sMwcpmJe2YmlvuA3gqVfnqtqU=";
    };

    sourceRoot = ".";

    nativeBuildInputs = [ pkgs.makeWrapper ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out/lib/nrjmx
      cp -r usr/lib/nrjmx/. $out/lib/nrjmx/
      makeWrapper ${pkgs.jre}/bin/java $out/bin/nrjmx \
        --add-flags "-cp '$out/lib/nrjmx/*:$out/lib/nrjmx/connectors/*' org.newrelic.nrjmx.Application"
      runHook postInstall
    '';

    meta = with lib; {
      description = "New Relic JMX fetcher";
      homepage = "https://github.com/newrelic/nrjmx";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "nrjmx";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/nrjmx" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nrjmx";
    "org.opencontainers.image.description" = "New Relic JMX fetcher";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
