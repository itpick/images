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
    # kc.sh-wrapped pipes through sed/xargs during startup. coreutils doesn't
    # include either, so the script fails immediately with "command not found"
    # if these aren't on PATH.
    gnused
    findutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkCustomUserEnv pkgs keycloakUser [];

  # mkCustomUserEnv always adds /tmp (real dir, mode 1777). When pulled into
  # buildEnv, /tmp becomes a SYMLINK back to the nix-store userEnv path —
  # which collides with tmpDir's real /tmp at image-build time
  # ("the file '/tmp' already exists in the graph"). Strip /tmp from the
  # userEnv copy so tmpDir is the only contributor for that path.
  userEnvSansTmp = pkgs.runCommand "keycloak-user-env-no-tmp" {} ''
    mkdir -p $out
    cp -rL ${userEnv}/. $out/
    chmod -R u+w $out
    rm -rf $out/tmp
  '';

  # Pre-create writable data dirs under /opt/keycloak (compose convention).
  # perms below assigns 999:999 ownership so the dirs are writable when the
  # container runs as the keycloak user under cap_drop: ALL (no runtime chown).
  kcDirs = pkgs.runCommand "keycloak-fips-dirs" {} ''
    mkdir -p $out/opt/keycloak/data/import
    mkdir -p $out/opt/keycloak/data/sessions
    chmod 755 $out/opt/keycloak/data/import
    chmod 755 $out/opt/keycloak/data/sessions
  '';

  # The nix-base /tmp is a symlink to a read-only nix-store path, so the JVM
  # can't create temp files there ("ThreadContextFcntl::create_tempfile"
  # assertion fires immediately on Quarkus startup). Bake a real writable
  # /tmp into a dedicated layer (outside buildEnv, so it isn't symlinked).
  tmpDir = pkgs.runCommand "keycloak-fips-tmp" {} ''
    mkdir -p $out/tmp
    chmod 1777 $out/tmp
  '';

in nix2container.buildImage {
  name = "keycloak-fips";
  tag = pkgs.keycloak.version;

  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "keycloak-fips-root";
          paths = base.basePackages ++ imagePkgs ++ [ userEnvSansTmp kcDirs ];
        })
        # tmpDir intentionally OUTSIDE buildEnv — buildEnv would symlink it
        # back to the nix store and re-introduce the read-only /tmp problem.
        tmpDir
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
        {
          path = tmpDir;
          regex = "/tmp";
          mode = "1777";
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
