{ mkImage, pkgs, lib, ... }:

# Omni - Sidero Labs Kubernetes/Talos management platform
# https://github.com/siderolabs/omni
# omni-fips packages the upstream omni linux/amd64 binary.

let
  version = "1.9.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "omni-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/siderolabs/omni/releases/download/v${version}/omni-linux-amd64";
      sha256 = "1bzh9gvkdy9bx376bjmwnq1q2dmqjwlkbinw44pwg0jfw5q5s5p8";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.zlib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/omni
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "omni-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/omni" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "omni-fips";
    "org.opencontainers.image.description" = "Sidero Labs Omni management platform";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
