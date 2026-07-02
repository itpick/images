{ mkImage, pkgs, lib, ... }:

# Cloud SQL Auth Proxy - secure connections to Cloud SQL instances
# https://github.com/GoogleCloudPlatform/cloud-sql-proxy

let
  version = "2.23.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "cloud-sql-proxy";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v${version}/cloud-sql-proxy.linux.amd64";
      hash = "sha256-zWidWCuCb6W8gsAczBTkWlggDDzvv5I86WxCKCXk5vY=";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/cloud-sql-proxy
      runHook postInstall
    '';

    meta = with lib; {
      description = "Cloud SQL Auth Proxy";
      homepage = "https://github.com/GoogleCloudPlatform/cloud-sql-proxy";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "cloud-sql-proxy";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/cloud-sql-proxy" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "cloud-sql-proxy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}