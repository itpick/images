{ mkImage, pkgs, lib, ... }:

# pulumi-language-nodejs - Pulumi Node.js language host plugin
# Distributed inside the main Pulumi CLI release tarball
# https://github.com/pulumi/pulumi

let
  version = "3.248.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "pulumi-language-nodejs";
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
      install -Dm755 pulumi-language-nodejs $out/bin/pulumi-language-nodejs
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "pulumi-language-nodejs";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pulumi-language-nodejs" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "pulumi-language-nodejs";
    "org.opencontainers.image.description" = "Pulumi Node.js language host plugin";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
