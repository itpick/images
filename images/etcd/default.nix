{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for etcd:
# Packages available in nixpkgs:
#   pkgs.etcd  # etcd-3.6 (3.6.6-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)

mkImage {
  drv = pkgs.etcd;
  name = "etcd";
  tag = "v${pkgs.etcd.version}";
  entrypoint = [ "${pkgs.etcd}/bin/etcd" ];
  # Was empty (no command). Run a single-node etcd: listen for clients on
  # 0.0.0.0:2379 so the etcd / kind-test probe can reach it. etcd requires
  # --advertise-client-urls when --listen-client-urls is set, and its
  # checkHostURLs rejects an unspecified host (0.0.0.0) there — so advertise a
  # concrete 127.0.0.1 (peer URLs default to localhost:2380, bootstrapping the
  # one-member "default" cluster). Data dir under the writable /tmp mkImage
  # provides. Operators override the advertise URL + mount a PVC at --data-dir.
  cmd = [
    "--listen-client-urls=http://0.0.0.0:2379"
    "--advertise-client-urls=http://127.0.0.1:2379"
    "--data-dir=/tmp/etcd"
  ];
  user = "0:0";  # etcd typically needs root for data directory access

  # NB: no ETCD_DATA_DIR env — etcd fatals ("conflicting environment variable
  # is shadowed by corresponding command-line flag") when the env duplicates
  # the --data-dir flag set above. The flag is the single source of truth.

  labels = {
    "org.opencontainers.image.title" = "etcd";
    "org.opencontainers.image.description" = "Distributed reliable key-value store for the most critical data of a distributed system";
    "org.opencontainers.image.version" = pkgs.etcd.version;
    "io.nix-containers.chart" = "etcd";
  };
}
