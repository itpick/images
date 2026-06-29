{ mkImage, pkgs, lib, ... }:

# boring-registry - open source Terraform/OpenTofu module and provider registry
# https://github.com/boring-registry/boring-registry
let
  version = "0.18.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "boring-registry";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/boring-registry/boring-registry/releases/download/v${version}/boring-registry_${version}_Linux_x86_64.tar.gz";
      hash = "sha256-W+kVmjpxKTN/VEhacJNKSHQhMMOHnbGP0tPyo1Lvhdk=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 boring-registry $out/bin/boring-registry
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "boring-registry-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/boring-registry" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "boring-registry";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
