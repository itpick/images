{ mkImage, pkgs, lib, ... }:

# pulumi-language-go - Pulumi Go language host plugin
# Distributed inside the main Pulumi CLI release tarball
# https://github.com/pulumi/pulumi

let
  version = "3.248.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "pulumi-language-go";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/pulumi/pulumi/releases/download/v${version}/pulumi-v${version}-linux-x64.tar.gz";
      hash = "sha256-oTcy2JIfmdcLmuJw15w7V1uzdwf850huZP7zM6/BGuA=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    # Tarball unpacks into a top-level pulumi/ directory.
    sourceRoot = "pulumi";

    installPhase = ''
      runHook preInstall
      install -Dm755 pulumi-language-go $out/bin/pulumi-language-go
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "pulumi-language-go";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pulumi-language-go" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "pulumi-language-go";
    "org.opencontainers.image.description" = "Pulumi Go language host plugin";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
