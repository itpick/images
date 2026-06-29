{ mkImage, pkgs, lib, ... }:

# NATS Server - high-performance messaging system
# https://github.com/nats-io/nats-server
# (nats-fips: packages the upstream nats-server release binary)

let
  version = "2.14.3";

  drv = pkgs.stdenv.mkDerivation {
    pname = "nats-server";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/nats-io/nats-server/releases/download/v${version}/nats-server-v${version}-linux-amd64.tar.gz";
      hash = "sha256-89DIIMdJ+B1xcxD7ANSQORnnDj5msmi9NSoIi5eI65M=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "nats-server-v${version}-linux-amd64";

    installPhase = ''
      runHook preInstall
      install -Dm755 nats-server $out/bin/nats-server
      runHook postInstall
    '';

    meta = with lib; {
      description = "High-performance messaging server (NATS)";
      homepage = "https://github.com/nats-io/nats-server";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "nats-fips";
  tag = "v${version}";
  buildType = "binary";
  entrypoint = [ "${drv}/bin/nats-server" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nats-fips";
    "org.opencontainers.image.description" = "NATS messaging server";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
