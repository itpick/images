{ mkImage, pkgs, lib, ... }:

# containerd fuse-overlayfs snapshotter (rootless overlayfs via FUSE)
# https://github.com/containerd/fuse-overlayfs-snapshotter

let
  version = "2.1.7";

  drv = pkgs.stdenv.mkDerivation {
    pname = "fuse-overlayfs-snapshotter";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/containerd/fuse-overlayfs-snapshotter/releases/download/v${version}/containerd-fuse-overlayfs-${version}-linux-amd64.tar.gz";
      hash = "sha256:1wvn0f4zp7d65ilfp884ciqnh1p465s1capckkw1lf127h24hhfm";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 containerd-fuse-overlayfs-grpc $out/bin/containerd-fuse-overlayfs-grpc
      runHook postInstall
    '';

    meta = with lib; {
      description = "containerd snapshotter plugin for fuse-overlayfs";
      homepage = "https://github.com/containerd/fuse-overlayfs-snapshotter";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "fuse-overlayfs-snapshotter";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/containerd-fuse-overlayfs-grpc" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "fuse-overlayfs-snapshotter";
    "org.opencontainers.image.description" = "containerd snapshotter plugin for fuse-overlayfs";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
