{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for syncthing:
# Packages available in nixpkgs:
#   pkgs.syncthing  # Open Source Continuous File Synchronization

mkImage {
  drv = pkgs.syncthing;
  name = "syncthing";
  tag = "v${pkgs.syncthing.version}";
  entrypoint = [ "${pkgs.syncthing}/bin/syncthing" ];
  # Was `-gui-address=...` (single dash), which syncthing 2.x rejects
  # ("unknown flag -g") — the flag is now --gui-address. Bind the GUI/API on
  # 0.0.0.0:8384 so the kind-test probe can reach it, and --no-browser since
  # there's no browser in a container. Syncthing also stores its config, TLS
  # keys and database under $HOME, but /var/syncthing isn't writable by the
  # nonroot user on the read-only root — point HOME at the writable /tmp.
  # Operators mount a PVC at HOME.
  cmd = [ "--gui-address=0.0.0.0:8384" "--no-browser" ];

  env = {
    HOME = "/tmp/syncthing";
  };

  labels = {
    "org.opencontainers.image.title" = "Syncthing";
    "org.opencontainers.image.description" = "Open Source Continuous File Synchronization";
    "org.opencontainers.image.version" = pkgs.syncthing.version;
    "io.nix-containers.chart" = "syncthing";
  };
}
