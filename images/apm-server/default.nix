{ mkImage, pkgs, lib, ... }:

# Elastic APM Server - upstream prebuilt release binary
# https://github.com/elastic/apm-server / https://www.elastic.co/apm

let
  version = "9.4.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "apm-server";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://artifacts.elastic.co/downloads/apm-server/apm-server-${version}-linux-x86_64.tar.gz";
      hash = "sha256-qg9uCMsYPH5c2no3uCIr9qtNstQp0s/ErE7grXtJw/w=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.zlib ];

    sourceRoot = "apm-server-${version}-linux-x86_64";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/apm-server
      cp -r . $out/share/apm-server/
      install -Dm755 apm-server $out/bin/apm-server
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "apm-server";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/apm-server" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "apm-server";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
