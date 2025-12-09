{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for openldap:
# Packages available in nixpkgs:
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libevent  # libevent (2.1.12-r8)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libsodium  # libsodium (1.0.20-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openldap  # openldap-2.6 (2.6.10-r7)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.unixodbc  # unixodbc (2.3.14-r0)
# Packages NOT in nixpkgs:
#   heimdal-libs (7.8.0-r42)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libldap-2.6 (2.6.10-r7)
#   libltdl (2.5.4-r0)
#   libssl3 (3.6.0-r4)
#   mosquitto-libs (2.0.22-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openldap-2.6-back-asyncmeta (2.6.10-r7)
#   openldap-2.6-back-dnssrv (2.6.10-r7)
#   openldap-2.6-back-ldap (2.6.10-r7)
#   openldap-2.6-back-lload (2.6.10-r7)
#   openldap-2.6-back-mdb (2.6.10-r7)
#   openldap-2.6-back-meta (2.6.10-r7)
#   openldap-2.6-back-null (2.6.10-r7)
#   openldap-2.6-back-passwd (2.6.10-r7)
#   openldap-2.6-back-relay (2.6.10-r7)
#   openldap-2.6-back-sock (2.6.10-r7)
#   openldap-2.6-back-sql (2.6.10-r7)
#   ... and 35 more

let
  packages = with pkgs; [
    openldap
    bash
    coreutils
  ];

in
nix2container.buildImage {
  name = "openldap";
  tag = pkgs.openldap.version;

  copyToRoot = [
    (buildEnv {
      name = "openldap-root";
      paths = base.basePackages ++ packages;
    })
  ];

  # Chainguard runs openldap as root
  config = nonRoot.rootConfig // {
    Env = base.defaultEnv ++ nonRoot.rootEnv ++ [
      "PATH=${lib.makeBinPath packages}"
    ];
    ExposedPorts = {
      "389/tcp" = {};
      "636/tcp" = {};
    };
    Entrypoint = [ "${pkgs.openldap}/libexec/slapd" ];
    Cmd = [ "-d" "256" "-h" "ldap:/// ldapi:///" "-F" "/etc/ldap/slapd.d" ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "OpenLDAP directory server";
      "org.opencontainers.image.version" = pkgs.openldap.version;
      "io.nix-containers.chart" = "nifi";
    };
  };
}
