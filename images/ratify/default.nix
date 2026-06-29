{ mkImage, pkgs, lib, ... }:

# Ratify - verification framework for container images and artifacts
# https://github.com/notaryproject/ratify

let
  version = "1.4.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "ratify";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/notaryproject/ratify/releases/download/v${version}/ratify_${version}_linux_amd64.tar.gz";
      hash = "sha256:06k7cs7pxa6ch66s762w79r5ivbrc1x2g99zdyv7vl8bsars4wyv";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 ratify $out/bin/ratify
      runHook postInstall
    '';
  };

in mkImage {
  inherit drv;
  name = "ratify";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/ratify" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "ratify";
    "org.opencontainers.image.description" = "Verification framework for container images and artifacts";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
