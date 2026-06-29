{ mkImage, pkgs, lib, ... }:

# Metacontroller - add-on for building Kubernetes controllers
# https://github.com/metacontroller/metacontroller

let
  version = "4.15.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "metacontroller";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/metacontroller/metacontroller/releases/download/v${version}/metacontroller_.${version}_Linux_x86_64.tar.gz";
      hash = "sha256:1qm1qfa3p7qm8vq44n7r0hlhxiv00jnrznkgbfnymhc4lw4kmqmd";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 metacontroller $out/bin/metacontroller
      runHook postInstall
    '';

    meta = with lib; {
      description = "Add-on for building Kubernetes controllers";
      homepage = "https://github.com/metacontroller/metacontroller";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "metacontroller";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/metacontroller" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "metacontroller";
    "org.opencontainers.image.description" = "Add-on for building Kubernetes controllers";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
