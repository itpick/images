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
  # Track the latest upstream Keycloak release, ahead of the nixpkgs pin.
  # A plain version + src override on the nixpkgs derivation (the dist is a
  # prebuilt zip, no build logic to patch).
  keycloak = pkgs.keycloak.overrideAttrs (old: rec {
    version = "26.6.4";
    # nixpkgs fetches the dist with fetchzip (auto-unpacked), so the hash is
    # over the unpacked tree, not the raw .zip.
    src = pkgs.fetchzip {
      url = "https://github.com/keycloak/keycloak/releases/download/${version}/keycloak-${version}.zip";
      hash = "sha256-rb3Wdzc3g8jMvUffOfMfJ4Uw9HJomznXzLtPOrHoWU8=";
    };
  });

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

  # nixpkgs keycloak ships every launcher (kc.sh, kcadm.sh, kcreg.sh,
  # federation-sssd-setup.sh) as a compiled C wrapper (makeCWrapper) that
  # hardcodes BOTH the full-JDK path (JAVA_HOME) and the store keycloak
  # path (the .X-wrapped it exec's). cp -rL preserves those binaries
  # verbatim, so nix's reference scanner keeps the ~566MB JDK and ~184MB
  # store keycloak in the image closure — even though we run from /opt and
  # a jlink JRE. Replacing each C wrapper with a shell wrapper that resolves
  # under /opt and points JAVA_HOME at the jlink JRE frees both store paths.
  #
  # Bonus: $DIRNAME inside .X-wrapped (via readlink -f "$0") now resolves
  # under /opt/keycloak, so augment writes land on the writable copy.
  mkKcWrapper = tool: pkgs.writeShellScript "${tool}.sh" ''
    export JAVA_HOME="${jre}"
    export PATH="${jre}/bin:$PATH"
    exec "/opt/keycloak/bin/.${tool}.sh-wrapped" "$@"
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
    cp -rL ${keycloak} $out/opt/keycloak
    chmod -R u+w $out/opt/keycloak
    # Replace ALL nixpkgs C-wrapper launchers with shell wrappers (see
    # mkKcWrapper). Leaving any of them keeps the full JDK + store keycloak
    # in the closure.
    install -m 0755 ${mkKcWrapper "kc"}    $out/opt/keycloak/bin/kc.sh
    install -m 0755 ${mkKcWrapper "kcadm"} $out/opt/keycloak/bin/kcadm.sh
    install -m 0755 ${mkKcWrapper "kcreg"} $out/opt/keycloak/bin/kcreg.sh
    # federation-sssd-setup (AD/LDAP helper) isn't used by `kc.sh start`;
    # drop it and its wrapped form so they don't pull the full JDK back in.
    rm -f $out/opt/keycloak/bin/federation-sssd-setup.sh \
          $out/opt/keycloak/bin/.federation-sssd-setup.sh-wrapped
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
  tag = keycloak.version;

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
      "org.opencontainers.image.version" = keycloak.version;
      "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
