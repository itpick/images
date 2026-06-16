{ mkImage, pkgs, lib, ... }:

let
  # The forgejo helm chart's init containers run scripts mounted from
  # a ConfigMap with `#!/usr/bin/env bash` shebangs (init_directory_
  # structure.sh.tpl, config_environment.sh.tpl, configure_gitea.sh.tpl).
  # nix-store-only images have busybox's env at /bin/env but nothing at
  # /usr/bin/env, so the shebang fails to resolve and init containers
  # error before main can start. Use a RELATIVE symlink (-> /bin/env) so
  # the resolved target stays in-image regardless of which derivation
  # ends up providing /bin/env in the final layer (busybox in the base
  # mkImage layer here -- if we'd used `${pkgs.coreutils}/bin/env` as
  # the target, nix2container's copyToRoot conflict-resolution between
  # busybox and coreutils on /bin/env would silently drop coreutils
  # from the closure and the symlink would dangle).
  envCompat = pkgs.runCommand "forgejo-env-compat" {} ''
    mkdir -p $out/usr/bin
    ln -s /bin/env $out/usr/bin/env
  '';
in
mkImage {
  drv = pkgs.forgejo;
  name = "forgejo";
  tag = pkgs.forgejo.version;
  entrypoint = [ "${pkgs.forgejo}/bin/gitea" ];
  # Charts (forgejo's official chart, code.forgejo.org/forgejo/runner,
  # etc.) leave `command` and `args` unset on the container spec and
  # rely on the image's OCI Entrypoint+Cmd to start the web server.
  # Previously `cmd = [ "--help" ]` made the container print the usage
  # banner and exit 0 immediately, surfacing as a CrashLoopBackOff
  # whose stdout was just `GLOBAL OPTIONS:` rather than the expected
  # `Listening on http://0.0.0.0:3000`. `web` is gitea/forgejo's
  # canonical subcommand to start the long-running server process.
  cmd = [ "web" ];

  # busybox (from mkImage's base layer) already provides chmod, chown,
  # mkdir, install, env at /bin/* -- the chart's init scripts find
  # them via PATH. We just need /usr/bin/env to resolve for the
  # `#!/usr/bin/env bash` shebangs (handled by envCompat above).
  extraPkgs = with pkgs; [ git openssh cacert bash gnupg ];
  extraContents = [ envCompat ];

  env = {
    GITEA_WORK_DIR = "/var/lib/gitea";
    GITEA_CUSTOM = "/var/lib/gitea/custom";
    GITEA_TEMP = "/tmp/gitea";
    USER = "git";
    HOME = "/var/lib/gitea/git";
    # Include /bin so `#!/usr/bin/env bash` shebangs (in chart-mounted
    # init scripts) can find bash. mkImage's default PATH is just
    # `busybox/bin:drv/bin` (nix-store paths only); /bin has bash and
    # all the FHS-named tools that nix2container's copyToRoot merge
    # places there. Without /bin on PATH, `env bash` from the chart's
    # init_directory_structure.sh shebang resolves to "no such file".
    PATH = "/bin:${pkgs.forgejo}/bin";
  };

  user = "1000:1000";

  labels = {
    "org.opencontainers.image.title" = "Forgejo";
    "org.opencontainers.image.description" = "Self-hosted Git service";
    "org.opencontainers.image.version" = pkgs.forgejo.version;
  };
}
