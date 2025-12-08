{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  packages = with pkgs; [
    openldap
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "openldap";
  tag = pkgs.openldap.version;

  copyToRoot = [
    (buildEnv {
      name = "openldap-root";
      paths = base.basePackages ++ packages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
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
