{ mkImage, pkgs, lib, ... }:

# Kiali - observability console for the Istio service mesh
# https://github.com/kiali/kiali
# Note: "-fips" denotes the same upstream Kiali tool; we package the upstream linux/amd64 binary.

let
  version = "2.28.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "kiali";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/kiali/kiali/releases/download/v${version}/kiali-linux-amd64";
      hash = "sha256:1mh3xhc5kfqv3rblcdfh1b4kfc7n2v58dls9180fd79k2zmd8xqq";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/kiali
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "kiali-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/kiali" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "kiali-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
