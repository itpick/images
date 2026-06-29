{ mkImage, pkgs, lib, ... }:

# cfssl - CloudFlare's PKI/TLS toolkit (upstream prebuilt binaries)
# https://github.com/cloudflare/cfssl
let
  version = "1.6.5";

  cfsslBin = pkgs.fetchurl {
    url = "https://github.com/cloudflare/cfssl/releases/download/v${version}/cfssl_${version}_linux_amd64";
    hash = "sha256-/006E4fqPh7nT0u45f/py6tb7kPHEDM8IG0UGZVD698=";
  };

  cfssljsonBin = pkgs.fetchurl {
    url = "https://github.com/cloudflare/cfssl/releases/download/v${version}/cfssljson_${version}_linux_amd64";
    hash = "sha256-CfvLejs9Y5STbqYeq/8eilmorDtSje6xTPZs276aU08=";
  };

  drv = pkgs.stdenv.mkDerivation {
    pname = "cfssl-self-sign-fips";
    inherit version;

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 ${cfsslBin} $out/bin/cfssl
      install -Dm755 ${cfssljsonBin} $out/bin/cfssljson
      runHook postInstall
    '';
  };
in
mkImage {
  inherit drv;
  name = "cfssl-self-sign-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/cfssl" ];
  cmd = [ "version" ];
  labels = {
    "org.opencontainers.image.title" = "cfssl-self-sign-fips";
    "org.opencontainers.image.description" = "CloudFlare cfssl PKI/TLS toolkit";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
