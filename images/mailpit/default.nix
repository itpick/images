{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.mailpit;
  name = "mailpit";
  tag = "v${pkgs.mailpit.version}";
  
  entrypoint = [ "mailpit" ];
  # Was `--help` (a one-shot). Run the mail server: the web UI on 0.0.0.0:8025
  # and the SMTP listener on 0.0.0.0:1025 (mailpit's defaults are `[::]:8025` /
  # `[::]:1025` — set explicit 0.0.0.0 so it's reachable on IPv4-only clusters).
  # Messages are held in mailpit's default in-memory store, so no writable dir
  # or config is needed. Operators add --database for persistence.
  cmd = [
    "--listen=0.0.0.0:8025"
    "--smtp=0.0.0.0:1025"
  ];

  labels = {
    "org.opencontainers.image.title" = "mailpit";
    "org.opencontainers.image.description" = "Email & SMTP testing tool with web UI";
    "org.opencontainers.image.version" = pkgs.mailpit.version;
  };
  
  user = nonRoot.userString;
}
