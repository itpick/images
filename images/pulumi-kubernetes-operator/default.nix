{ mkImage, pkgs, lib, nonRoot, ... }:

# pulumi-kubernetes-operator built from upstream source (v2.9.0).
#
# nixpkgs has no `pulumi-kubernetes-operator` package. This image must be a
# drop-in for the upstream one, because the chart sets AGENT_IMAGE to the SAME
# image it runs the controller from (templates/deployment.yaml). That means the
# image is used in three distinct ways and all three must work:
#
#   1. controller     - chart passes args ["/manager", "--leader-elect", ...]
#   2. bootstrap init - operator runs `cp /agent /tini /share/` from it
#   3. workspace exec - the copied binaries run as
#                       `/share/tini /share/agent -- serve ...`
#
# Hence: BOTH binaries, plus tini, plus upstream's exact entrypoint contract.
#
# Do NOT set entrypoint to the manager binary. The chart passes "/manager" as
# the first element of `args`, and operator/cmd/main.go parses flags with the
# stdlib `flag` package, which stops at the first non-flag argument. With
# entrypoint=[manager] the effective argv is `manager /manager --leader-elect
# ...` and every flag is silently dropped -- leader election off, metrics bind
# address left at "0". The operator still starts and reports healthy, so this
# fails silently. Match upstream's ENTRYPOINT ["/tini","--"] + CMD ["/manager"].

let
  version = "2.10.0";

  goModBump = import ../../lib/goModBump.nix { inherit lib; };

  pkoBin = pkgs.buildGoModule (rec {
    pname = "pulumi-kubernetes-operator";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "pulumi";
      repo = "pulumi-kubernetes-operator";
      rev = "v${version}";
      hash = "sha256-esLPmI0ZIo1epRxFGVs0E02vj6ih8BLCGQbWiIVj5Ko=";
    };

    # To bump: set vendorHash to lib.fakeHash, run `nix build`, copy the
    # "got:" value from the resulting hash-mismatch error.
    vendorHash = "sha256-Oug4HKa8CNLboqQMxJuzJNI+aY8MWd9HOLMK1Kd2jUw=";

    # Single Go module (github.com/pulumi/pulumi-kubernetes-operator/v2);
    # `agent` is a subpackage, not a separate module.
    subPackages = [ "operator/cmd" "agent" ];

    ldflags = [
      "-w"
      "-X github.com/pulumi/pulumi-kubernetes-operator/v2/operator/version.Version=v${version}"
      "-X github.com/pulumi/pulumi-kubernetes-operator/v2/agent/version.Version=v${version}"
    ];

    env.CGO_ENABLED = 0;
    doCheck = false;

    # buildGoModule names each binary after its subPackage directory, so
    # operator/cmd installs as $out/bin/cmd. Upstream's chart invokes
    # /manager; rename to match. `agent` is already correctly named.
    postInstall = ''
      mv $out/bin/cmd $out/bin/manager
    '';

    meta = with lib; {
      description = "Pulumi Kubernetes Operator: manage Pulumi Stack CRs in-cluster";
      homepage = "https://github.com/pulumi/pulumi-kubernetes-operator";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  } // goModBump [
    "github.com/go-jose/go-jose/v4@v4.1.6"
    "github.com/klauspost/compress@v1.20.2"
  ]);

  # Top-level symlinks. /manager is what the chart's args invoke; /agent and
  # /tini are what the bootstrap init container copies out with
  # `cp /agent /tini /share/`. Same pattern as the keda chart's /keda symlink
  # and the cloudnative-pg chart's /manager symlink.
  #
  # tini MUST be the upstream `tini-static` release binary, and this is not
  # a preference -- it has to satisfy TWO independent constraints that no
  # nixpkgs build of tini satisfies at once. /agent and /tini do not run in this image -- the bootstrap
  # init container copies them onto a shared emptyDir and the *workspace*
  # container execs them, and that container is a completely different
  # image (pulumi/pulumi:<ver>-nonroot, Debian-based) with no /nix/store.
  # A dynamically-linked tini carries an ELF interpreter of
  # /nix/store/<hash>-glibc-*/lib/ld-linux-x86-64.so.2, which does not exist
  # there, so the exec fails. Linux reports a missing ELF interpreter as
  # ENOENT, so the symptom is the maximally misleading
  #   exec /share/tini: no such file or directory
  # for a file that is present and executable. Observed on a live cluster
  # with the v2.9.0 build that shipped dynamic tini.
  #
  # CONSTRAINT 2 -- glibc getopt semantics. The operator's workspace command
  # is literally
  #     /share/tini /share/agent -- serve --workspace ...
  # with the `--` AFTER the program name. tini passes everything from the
  # first non-option onward to the child, so whether the child sees that
  # `--` depends on the libc's getopt: GNU getopt PERMUTES and consumes it,
  # POSIX getopt (musl) stops at the first non-option and preserves it. The
  # agent is a cobra CLI, and `agent -- serve` does not resolve the `serve`
  # subcommand -- it prints help and exits 0, so the workspace container
  # "Completed" successfully while serving nothing and the Stack hangs.
  #
  # This rules out pkgs.pkgsStatic.tini, which is musl. Measured:
  #     glibc tini -> child argv: serve --workspace X
  #     musl  tini -> child argv: -- serve --workspace X
  # The upstream release binary is static AND glibc-built, so it satisfies
  # both constraints. It is also exactly what upstream's own Dockerfile
  # ships, which is the compatibility target.
  #
  # /agent needs no equivalent treatment: buildGoModule with
  # CGO_ENABLED=0 already produces a static binary, and it is exec'd
  # directly rather than through an option parser.
  #
  # tini is deliberately NOT listed in mkImage's `extraPkgs` below. Any
  # package passed there is a *direct* member of the base layer's
  # `copyToRoot`, and nix2container flattens direct copyToRoot members by
  # stripping their own store-path prefix (so e.g. tini's bin/tini would be
  # relocated to /bin/tini, and /nix/store/<hash>-tini-*/bin/tini would no
  # longer exist). This symlink's target is that literal, unrewritten store
  # path, so it must reach tini only as an indirect closure reference (via
  # this derivation), exactly like /manager and /agent reach pkoBin -- pkoBin
  # is likewise never a direct `extraPkgs`/`extraContents` member, only the
  # image's `drv`. Verified empirically: with tini in extraPkgs, /tini
  # resolved to a dangling symlink; removing it fixed the bootstrap `cp`.
  # Upstream tini release binary -- static, glibc-built. See the two
  # constraints documented above.
  tiniStatic =
    let
      arch =
        if pkgs.stdenv.hostPlatform.isAarch64 then "arm64"
        else "amd64";
      hash = {
        amd64 = "sha256-xbBma0y2dpAfkN/LNxBng8X+IHewRZCXO4hZUGEbMO4=";
        arm64 = "sha256-6uHTqlDEj7I7jL3042nQkQ38U4Vmv9Cd+Jp3SqhKSLk=";
      }.${arch};
    in
    pkgs.stdenv.mkDerivation {
      pname = "tini-static";
      version = "0.19.0";
      src = pkgs.fetchurl {
        url = "https://github.com/krallin/tini/releases/download/v0.19.0/tini-static-${arch}";
        inherit hash;
      };
      dontUnpack = true;
      dontStrip = true;
      installPhase = "install -Dm755 $src $out/bin/tini";
      meta.description = "tini (upstream static release binary)";
    };

  rootCompat = pkgs.runCommand "pko-root-compat" {} ''
    mkdir -p $out
    ln -s ${pkoBin}/bin/manager $out/manager
    ln -s ${pkoBin}/bin/agent   $out/agent
    ln -s ${tiniStatic}/bin/tini $out/tini
  '';
in
mkImage {
  drv = pkoBin;
  name = "pulumi-kubernetes-operator";
  tag = "v${version}";

  # Matches upstream's Dockerfile final stage exactly.
  entrypoint = [ "/tini" "--" ];
  cmd = [ "/manager" ];

  # tini is intentionally excluded here -- see the rootCompat comment above
  # (both for the flattening reason and because it must stay the upstream
  # static release binary).
  extraPkgs = with pkgs; [ cacert tzdata ];
  extraContents = [ rootCompat ];

  labels = {
    "org.opencontainers.image.title" = "Pulumi Kubernetes Operator";
    "org.opencontainers.image.description" = "Manage Pulumi Stack CRs in-cluster";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.image.upstream" = "https://github.com/pulumi/pulumi-kubernetes-operator";
    "io.nix-containers.image.category" = "operator";
  };

  user = nonRoot.userString;
}
