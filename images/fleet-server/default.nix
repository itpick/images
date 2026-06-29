{ mkImage, pkgs, lib, ... }:

# fleet-server - Elastic Fleet Server (central management for Elastic Agents)
# https://www.elastic.co/guide/en/fleet/current/fleet-server.html

let
  version = "9.0.3";

  drv = pkgs.stdenv.mkDerivation {
    pname = "fleet-server";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://artifacts.elastic.co/downloads/fleet-server/fleet-server-${version}-linux-x86_64.tar.gz";
      hash = "sha256:07zavzf1kdis5x7jnn3nsirf43jis0ax914587f1b4a1b4rl6sb5";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "fleet-server-${version}-linux-x86_64";

    installPhase = ''
      runHook preInstall
      install -Dm755 fleet-server $out/bin/fleet-server
      runHook postInstall
    '';

    meta = with lib; {
      description = "Elastic Fleet Server";
      homepage = "https://github.com/elastic/fleet-server";
      license = licenses.elastic20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "fleet-server";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/fleet-server" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "fleet-server";
    "org.opencontainers.image.description" = "Elastic Fleet Server";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
