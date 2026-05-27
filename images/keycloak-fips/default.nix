{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# keycloak-fips
# Keycloak identity broker, drop-in for the Iron Bank keycloak image.
# Same entrypoint shape: /bin/kc.sh with the caller's args passed through.
# Pre-creates /opt/keycloak/data/{import,sessions} writable by uid 999 so
# realm imports and session state work under compose stacks that mount
# host paths there with cap_drop: ALL.
#
# "fips" in the name is aspirational — true FIPS-validated mode would
# need a FIPS-mode JDK and the Bouncy Castle FIPS provider wired into
# Quarkus. This is the regular nixpkgs keycloak with the matching name
# scheme so downstream consumers can swap the image without renaming.

let
  keycloakUser = {
    uid = 999;
    gid = 999;
    name = "keycloak";
    home = "/home/keycloak";
  };

  imagePkgs = with pkgs; [
    keycloak
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkCustomUserEnv pkgs keycloakUser [];

  # Pre-create writable data dirs under /opt/keycloak (compose convention).
  # perms below assigns 999:999 ownership so the dirs are writable when the
  # container runs as the keycloak user under cap_drop: ALL (no runtime chown).
  kcDirs = pkgs.runCommand "keycloak-fips-dirs" {} ''
    mkdir -p $out/opt/keycloak/data/import
    mkdir -p $out/opt/keycloak/data/sessions
    chmod 755 $out/opt/keycloak/data/import
    chmod 755 $out/opt/keycloak/data/sessions
  '';

in nix2container.buildImage {
  name = "keycloak-fips";
  tag = pkgs.keycloak.version;

  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "keycloak-fips-root";
          paths = base.basePackages ++ imagePkgs ++ [ userEnv kcDirs ];
        })
      ];
      perms = [
        {
          path = kcDirs;
          regex = "/opt/keycloak/data/import";
          mode = "0755";
          uid = keycloakUser.uid;
          gid = keycloakUser.gid;
        }
        {
          path = kcDirs;
          regex = "/opt/keycloak/data/sessions";
          mode = "0755";
          uid = keycloakUser.uid;
          gid = keycloakUser.gid;
        }
      ];
    })
  ];

  config = {
    User = "${toString keycloakUser.uid}:${toString keycloakUser.gid}";
    WorkingDir = keycloakUser.home;
    Env = base.defaultEnv ++ [
      "HOME=${keycloakUser.home}"
      "USER=${keycloakUser.name}"
    ];
    Entrypoint = [ "${pkgs.keycloak}/bin/kc.sh" ];
    ExposedPorts = {
      "8080/tcp" = {};
      "8443/tcp" = {};
      "9000/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "keycloak-fips";
      "org.opencontainers.image.description" = "Keycloak identity broker (FIPS-intent build) with docker-library-compatible entrypoint, runs as uid 999";
      "org.opencontainers.image.version" = pkgs.keycloak.version;
      "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
