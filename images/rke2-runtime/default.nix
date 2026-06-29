{ mkImage, pkgs, lib, ... }:

# rke2-runtime - RKE2 (Rancher Kubernetes Engine 2) runtime binary
# https://github.com/rancher/rke2

let
  version = "1.36.2+rke2r1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "rke2";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/rancher/rke2/releases/download/v1.36.2%2Brke2r1/rke2.linux-amd64";
      hash = "sha256:0xqjrrcqdpi5yv4kiq6d4ld077nl07825g0cfilvlld1ay3yzjnp";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.zlib ];

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/rke2
      runHook postInstall
    '';

    meta = with lib; {
      description = "RKE2 (Rancher Kubernetes Engine 2) runtime";
      homepage = "https://github.com/rancher/rke2";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "rke2-runtime";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/rke2" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "rke2-runtime";
    "org.opencontainers.image.description" = "RKE2 Kubernetes distribution runtime";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
