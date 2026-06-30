{ mkImage, pkgs, lib, ... }:

# Grafana Pyroscope - continuous profiling platform
# https://github.com/grafana/pyroscope

let
  version = "2.1.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "grafana-pyroscope";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/grafana/pyroscope/releases/download/v${version}/pyroscope_${version}_linux_amd64.tar.gz";
      hash = "sha256:1x7z8y84plr6257kygya43syf81hv5132gvjqv3fdzj9ap03am95";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 pyroscope $out/bin/pyroscope
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "grafana-pyroscope";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pyroscope" ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run Pyroscope in
  # its default monolithic ("all") mode — it serves HTTP on :4040 and gRPC on
  # :9095 bound to all interfaces, reachable by the probe. The v2 components all
  # default their local-storage dirs to `./data*`, relative to the read-only "/"
  # workdir, so the nonroot pod exits (`mkdir ./data: permission denied`). Point
  # every storage path at the writable /tmp (the full set of dir flags from the
  # v2.1.0 help: pyroscopedb, metastore data/raft/snapshots, compactor,
  # blocks-storage sync, embedded-grafana, filesystem object store). Operators
  # mount a PVC and override these (or run microservices mode).
  cmd = [
    "-pyroscopedb.data-path=/tmp/data"
    "-metastore.data-dir=/tmp/data/metastore/data"
    "-metastore.raft.dir=/tmp/data/metastore/raft"
    "-metastore.raft.snapshots-dir=/tmp/data/metastore/snapshots"
    "-compactor.data-dir=/tmp/data/compactor"
    "-blocks-storage.bucket-store.sync-dir=/tmp/data/sync"
    "-embedded-grafana.data-path=/tmp/data/grafana"
    "-storage.filesystem.dir=/tmp/data/shared"
  ];
  labels = {
    "org.opencontainers.image.title" = "grafana-pyroscope";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
