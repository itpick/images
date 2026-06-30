{ mkImage, pkgs, lib, ... }:

# cloudprober - Active monitoring software
# https://cloudprober.org/

let
  # Bake an empty (comment-only) config at /etc/cloudprober/cloudprober.cfg.
  # A config with zero probe{} blocks is valid; cloudprober still runs its
  # built-in HTTP status/metrics server on :9313, so the image runs out of the
  # box. (Pointing --config_file at a real, if empty, file avoids depending on
  # cloudprober's empty-default-path behaviour.) Operators mount their own
  # config with probe{} blocks.
  cloudproberConfig = pkgs.writeTextDir "etc/cloudprober/cloudprober.cfg" ''
    # Minimal cloudprober config: no probes defined. The built-in HTTP
    # status/metrics server still listens on :9313. Add probe { ... } blocks
    # (or mount your own config) to start monitoring targets.
  '';

in
mkImage {
  drv = pkgs.cloudprober;
  name = "cloudprober";
  tag = "v${pkgs.cloudprober.version}";
  entrypoint = [ "${pkgs.cloudprober}/bin/cloudprober" ];
  # Was `--help` (a one-shot). Run with the baked (empty) config; cloudprober
  # serves its HTTP status/metrics endpoint on :9313.
  cmd = [ "--config_file=/etc/cloudprober/cloudprober.cfg" ];

  extraPkgs = with pkgs; [ cacert cloudproberConfig ];

  labels = {
    "org.opencontainers.image.title" = "cloudprober";
    "org.opencontainers.image.description" = "Active monitoring software to detect failures before users";
    "org.opencontainers.image.version" = pkgs.cloudprober.version;
  };
}
