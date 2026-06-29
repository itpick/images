{ mkImage, pkgs, lib, ... }:

# helm-mapkubeapis - Helm plugin to migrate deprecated Kubernetes APIs
# https://github.com/helm/helm-mapkubeapis
let
  version = "0.6.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "helm-mapkubeapis";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/helm/helm-mapkubeapis/releases/download/v${version}/helm-mapkubeapis_${version}_linux_amd64.tar.gz";
      hash = "sha256:152ybjiqjn2l6pc0lvck21gym1xz9hq09nyip66v74nisfkmi78g";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 mapkubeapis $out/bin/mapkubeapis
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "helm-mapkubeapis";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/mapkubeapis" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "helm-mapkubeapis";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
