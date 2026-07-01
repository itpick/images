{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for hugo:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.hugo  # hugo (0.152.2-r2)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libstdc++ (15.2.0-r6)

let
  # hugo packages
  hugoPackages = with pkgs; [
    hugo
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # Minimal starter site baked read-only at /etc/hugo-site. `hugo server` needs
  # a source directory with a config plus at least one layout; without a Cmd the
  # bare image has nothing to run (and would fail the pod kind-test with "no
  # command specified"). Operators mount their own site over /etc/hugo-site (or
  # point HUGO_SITE_SRC / override the command).
  hugoSite = pkgs.runCommand "hugo-site" { } ''
    mkdir -p $out/etc/hugo-site/layouts $out/etc/hugo-site/content
    printf "baseURL = 'http://localhost/'\ntitle = 'Hugo'\n" > $out/etc/hugo-site/hugo.toml
    printf '<!doctype html><html><body>Hugo server is running.</body></html>\n' > $out/etc/hugo-site/layouts/index.html
    printf '# Hugo\n' > $out/etc/hugo-site/content/_index.md
  '';

  # `hugo server` must create a `.hugo_build.lock` in the source root and writes
  # its cache under TMPDIR, neither of which a non-root, read-only image rootfs
  # can satisfy — so copy the baked site into a writable /tmp dir first, then
  # serve it. Bind 0.0.0.0 (the default is localhost) so the kind-test probe and
  # other pods can reach the server. writeShellApplication runs shellcheck at
  # build time, so the script is validated by the image build itself.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = [ pkgs.coreutils pkgs.hugo ];
    text = ''
      export TMPDIR="''${TMPDIR:-/tmp}"
      SITE_SRC="''${HUGO_SITE_SRC:-/etc/hugo-site}"
      WORKDIR="''${HUGO_WORKDIR:-/tmp/hugo-site}"

      mkdir -p "$WORKDIR" "$TMPDIR/hugo_cache"
      cp -R "$SITE_SRC"/. "$WORKDIR"/
      chmod -R u+w "$WORKDIR"

      exec hugo server \
        --source "$WORKDIR" \
        --cacheDir "$TMPDIR/hugo_cache" \
        --bind 0.0.0.0 \
        --port "''${HUGO_PORT:-1313}" \
        --renderToMemory \
        --watch=false \
        "$@"
    '';
  };

  # hugo (non-root) writes the build lock, the copied site, and its cache under
  # /tmp, which buildEnv otherwise leaves as a read-only store symlink. Declare
  # it 1777 in its own layer so it doesn't collide with buildEnv (same approach
  # as the nginx image).
  writableDirs = pkgs.runCommand "hugo-writable-dirs" { } ''
    mkdir -p $out/tmp
  '';

in
nix2container.buildImage {
  name = "hugo";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.hugo.version;

  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "hugo-root";
          paths = base.basePackages ++ hugoPackages ++ [ userEnv hugoSite entrypoint ];
        })
      ];
    })
    (nix2container.buildLayer {
      copyToRoot = [ writableDirs ];
      perms = [
        {
          path = writableDirs;
          regex = "/tmp";
          mode = "1777";
        }
      ];
    })
  ];

  config = nonRoot.defaultConfig // {
    # No Cmd in the bare stub → run hugo's live-preview server in the foreground
    # via the entrypoint (copies the baked site to writable /tmp, binds 0.0.0.0).
    Entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
    Cmd = [ ];
    ExposedPorts = {
      "1313/tcp" = { };
    };
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath hugoPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Hugo static site generator for fast and flexible website development";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.hugo.version;
      "io.nix-containers.image.upstream" = "https://gohugo.io/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "hugo,static-site,website";
    };
  };
}
