{ mkImage, pkgs, lib, ... }:

# boring-registry - open source Terraform/OpenTofu module & provider registry
# https://github.com/boring-registry/boring-registry

let
  version = "0.18.0";

  boring-registry = pkgs.stdenv.mkDerivation rec {
    pname = "boring-registry";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/boring-registry/boring-registry/releases/download/v${version}/boring-registry_${version}_Linux_x86_64.tar.gz";
      hash = "sha256-W+kVmjpxKTN/VEhacJNKSHQhMMOHnbGP0tPyo1Lvhdk=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp boring-registry $out/bin/boring-registry
      chmod +x $out/bin/boring-registry
      runHook postInstall
    '';

    meta = with lib; {
      description = "Open source Terraform/OpenTofu module and provider registry";
      homepage = "https://github.com/boring-registry/boring-registry";
      license = licenses.mit;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  drv = boring-registry;
  name = "boring-registry";
  tag = "v${version}";
  entrypoint = [ "${boring-registry}/bin/boring-registry" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "boring-registry";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
