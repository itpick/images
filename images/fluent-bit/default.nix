{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for fluent-bit:
# Packages available in nixpkgs:
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.fluent-bit  # fluent-bit-4.2 (4.2.0-r0)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libpq  # libpq-18 (18.1-r0)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libldap-2.6 (2.6.10-r7)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libsystemd (258.2-r3)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   sqlite-libs (3.51.1-r0)

let
  # The cmd points -c at /fluent-bit/etc/fluent-bit.conf (the upstream image's
  # config path), but the nixpkgs package doesn't ship there and nothing baked
  # it — Fluent Bit exits ("could not open configuration file"). Bake a minimal
  # classic config there: the built-in `dummy` input feeding the `stdout`
  # output, plus the HTTP server on 0.0.0.0:2020 for health/metrics. No writable
  # dir is needed. Operators mount their own config with real inputs/outputs.
  fluentbitConfig = pkgs.writeTextDir "fluent-bit/etc/fluent-bit.conf" ''
    [SERVICE]
        flush        1
        daemon       off
        log_level    info
        http_server  on
        http_listen  0.0.0.0
        http_port    2020

    [INPUT]
        name  dummy
        tag   dummy

    [OUTPUT]
        name   stdout
        match  *
  '';
in
mkImage {
  drv = pkgs.fluent-bit;
  name = "fluent-bit";
  tag = "v${pkgs.fluent-bit.version}";
  entrypoint = [ "${pkgs.fluent-bit}/bin/fluent-bit" ];
  cmd = [ "-c" "/fluent-bit/etc/fluent-bit.conf" ];
  # Chainguard runs fluent-bit as root
  user = "0:0";

  extraPkgs = with pkgs; [ libcap fluentbitConfig ];

  labels = {
    "org.opencontainers.image.title" = "Fluent Bit";
    "org.opencontainers.image.description" = "Fast and lightweight log processor and forwarder";
    "org.opencontainers.image.version" = pkgs.fluent-bit.version;
    "io.nix-containers.chart" = "fluent-bit";
  };
}
