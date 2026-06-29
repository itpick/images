{ mkImage, pkgs, lib, ... }:

# Docker-in-Docker (dockerd) - official static release binaries
# -fips variant: same upstream Docker binaries.
# https://docs.docker.com/engine/install/binaries/

let
  version = "29.6.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "docker-dind-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://download.docker.com/linux/static/stable/x86_64/docker-${version}.tgz";
      hash = "sha256-sN9KQ6mNfstwisvbWjSjQW4TtuOby73ylvUfDzRCsp8=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -Dm755 docker/dockerd $out/bin/dockerd
      install -Dm755 docker/docker $out/bin/docker
      install -Dm755 docker/containerd $out/bin/containerd
      install -Dm755 docker/containerd-shim-runc-v2 $out/bin/containerd-shim-runc-v2
      install -Dm755 docker/ctr $out/bin/ctr
      install -Dm755 docker/runc $out/bin/runc
      install -Dm755 docker/docker-init $out/bin/docker-init
      install -Dm755 docker/docker-proxy $out/bin/docker-proxy
      runHook postInstall
    '';

    dontStrip = true;

    meta = with lib; {
      description = "Docker-in-Docker daemon (static binaries)";
      homepage = "https://docs.docker.com/engine/install/binaries/";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };
in mkImage {
  inherit drv;
  name = "docker-dind-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/dockerd" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "docker-dind-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
