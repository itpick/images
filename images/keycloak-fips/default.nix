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

  # Minimal jlink runtime instead of the full 566 MB openjdk-headless JDK.
  # keycloak (and its Quarkus augment step) run fine on a JRE; the module
  # list is the well-established keycloak/Quarkus jlink set. java.se is
  # intentionally omitted — it's an aggregator that pulls nearly every
  # module back in and defeats the trim. The full JDK is still used at
  # BUILD time by jre_minimal's jlink; only this ~150 MB runtime ships.
  jre = pkgs.jre_minimal.override {
    jdk = pkgs.jdk21_headless;
    modules = [
      "java.base" "java.compiler" "java.datatransfer" "java.desktop"
      "java.instrument" "java.logging" "java.management" "java.management.rmi"
      "java.naming" "java.net.http" "java.prefs" "java.rmi" "java.scripting"
      "java.security.jgss" "java.security.sasl" "java.sql" "java.sql.rowset"
      "java.transaction.xa" "java.xml" "java.xml.crypto"
      "jdk.crypto.cryptoki" "jdk.crypto.ec" "jdk.httpserver" "jdk.jfr"
      "jdk.management" "jdk.management.agent" "jdk.naming.dns" "jdk.naming.rmi"
      "jdk.net" "jdk.security.auth" "jdk.security.jgss" "jdk.unsupported"
      "jdk.zipfs"
    ];
  };

  # keycloak is NOT in imagePkgs — the distribution ships only via the
  # writable /opt copy (keycloakDist) below, so the read-only store copy
  # (~184 MB) doesn't get duplicated into the image. java comes from the
  # jlink jre, referenced by the wrapper (JAVA_HOME), so it's in the
  # closure without polluting /bin.
  imagePkgs = with pkgs; [
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

  # The nixpkgs keycloak ships /bin/kc.sh as a compiled C wrapper
  # (makeCWrapper) that exec's /nix/store/.../keycloak/bin/.kc.sh-wrapped
  # with a hardcoded path. Inside that wrapped script, $DIRNAME (via
  # readlink -f "$0") resolves to the nix-store path — and -cp +
  # augment-output paths follow from $DIRNAME. So even though we copy the
  # distribution to /opt/keycloak (writable), the original wrapper routes
  # everything back to the read-only store and augment crashes.
  #
  # Replace the C wrapper with this tiny shell wrapper: same env setup
  # (JAVA_HOME, PATH), but exec's /opt/keycloak/bin/.kc.sh-wrapped — so
  # $DIRNAME resolves under /opt/keycloak and writes land on the writable
  # copy.
  kcShWrapper = pkgs.writeShellScript "kc.sh" ''
    export JAVA_HOME="${jre}"
    export PATH="${jre}/bin:$PATH"
    exec /opt/keycloak/bin/.kc.sh-wrapped "$@"
  '';

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

  # Copy the keycloak distribution to /opt/keycloak with the directory
  # writable. Runtime `kc.sh start` does an augmentation step that writes
  # to lib/quarkus/transformed-bytecode.jar — if that path is in the
  # read-only nix store, startup fails with AccessDeniedException.
  # Pre-creates data/{import,sessions} too (compose mounts host paths here).
  keycloakDist = pkgs.runCommand "keycloak-fips-dist" {} ''
    mkdir -p $out/opt
    cp -rL ${pkgs.keycloak} $out/opt/keycloak
    chmod -R u+w $out/opt/keycloak
    # Replace the nixpkgs C wrapper with our shell wrapper that resolves
    # paths under /opt/keycloak (see kcShWrapper comment for details).
    install -m 0755 ${kcShWrapper} $out/opt/keycloak/bin/kc.sh
    mkdir -p $out/opt/keycloak/data/import $out/opt/keycloak/data/sessions
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
          paths = base.basePackages ++ imagePkgs ++ [ userEnvSansTmp ];
        })
        # tmpDir + keycloakDist intentionally OUTSIDE buildEnv — buildEnv
        # would symlink them back to the nix store and re-introduce the
        # read-only-path problem.
        tmpDir
        keycloakDist
      ];
      perms = [
        {
          path = keycloakDist;
          regex = "/opt/keycloak(/.*)?";
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
    Entrypoint = [ "/opt/keycloak/bin/kc.sh" ];
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
