{ mkImage, pkgs, lib, ... }:

# Filebrowser - Web file browser
# https://filebrowser.org/

mkImage {
  drv = pkgs.filebrowser;
  name = "filebrowser";
  tag = "v${pkgs.filebrowser.version}";
  entrypoint = [ "${pkgs.filebrowser}/bin/filebrowser" ];
  # Was empty (no command). File Browser defaults to binding 127.0.0.1 and a
  # ./filebrowser.db database in the read-only nix-store cwd, so a nonroot run
  # CrashLoops. Bind 0.0.0.0:8080, put the Bolt DB under the writable /tmp, and
  # serve /tmp as the root. When the DB doesn't exist File Browser auto-enters
  # "quick setup" and bootstraps it with a default admin user, so the image runs
  # out of the box. Operators mount a PVC for the DB + their content root.
  cmd = [
    "--address" "0.0.0.0"
    "--port" "8080"
    "--database" "/tmp/filebrowser.db"
    "--root" "/tmp"
  ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Filebrowser";
    "org.opencontainers.image.description" = "Web-based file browser and manager";
    "org.opencontainers.image.version" = pkgs.filebrowser.version;
  };
}
