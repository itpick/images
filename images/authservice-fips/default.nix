{ mkImage, pkgs, lib, ... }:

# authservice - external authorization server for Envoy (OIDC/OAuth2)
# https://github.com/istio-ecosystem/authservice
let
  version = "1.1.7";

  drv = pkgs.stdenv.mkDerivation {
    pname = "authservice-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/istio-ecosystem/authservice/releases/download/v${version}/authservice-fips-linux-amd64.tar.gz";
      hash = "sha256:1inqrzbbfkjnbrzxq4balr7m9ygkiw6cw5ld53yfa0b9cbyg7962";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [
      pkgs.stdenv.cc.cc.lib
      pkgs.zlib
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 authservice-fips-linux-amd64 $out/bin/authservice
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "authservice-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/authservice" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "authservice-fips";
    "org.opencontainers.image.description" = "External authorization server for Envoy (OIDC/OAuth2)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
