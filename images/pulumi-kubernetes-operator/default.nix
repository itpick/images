{ mkImage, pkgs, lib, nonRoot, ... }:

# pulumi-kubernetes-operator built from upstream source (v2.7.0).
#
# nixpkgs has no `pulumi-kubernetes-operator` package, so the previous
# `images/pulumi-kubernetes-operator/default.nix` was a stub that
# bundled bash+coreutils with no operator binary at all (and a
# hardcoded `version = "latest"`). Any cluster swapping to it lost
# its Pulumi-driven workloads because the chart's
# `command: ["/manager"]` failed with "no such file".
#
# Build from source using `buildGoModule`, the upstream Dockerfile's
# build invocation as our reference (`go build -ldflags=-w -X ...
# /operator/cmd/main.go -> /manager`). The chart hardcodes the
# `/manager` path, so we install the binary directly at $out/bin/
# manager and rely on mkImage's extraContents pattern (a runCommand
# symlink) to surface `/manager` at the rootfs top level.

let
  version = "2.7.0";

  pkoBin = pkgs.buildGoModule rec {
    pname = "pulumi-kubernetes-operator";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "pulumi";
      repo = "pulumi-kubernetes-operator";
      rev = "v${version}";
      hash = "sha256-aksAYI6e5ypiQr51WFTaYDJYvprOPusPyn+4wCP4ncs=";
    };

    # To bump: set vendorHash to lib.fakeHash, run `nix build`, copy
    # the "got:" value from the resulting hash-mismatch error.
    vendorHash = "sha256-wUAp+brbKZWCs1wu0xw3l+HQLljMwJBo8U+6K+uOnPI=";

    subPackages = [ "operator/cmd" ];

    ldflags = [
      "-w"
      "-X github.com/pulumi/pulumi-kubernetes-operator/v2/operator/version.Version=v${version}"
    ];

    env.CGO_ENABLED = 0;
    doCheck = false;

    # buildGoModule with subPackages=[operator/cmd] installs the
    # binary as $out/bin/cmd (the directory name). Upstream's chart
    # invokes /manager; rename to match.
    postInstall = ''
      mv $out/bin/cmd $out/bin/manager
    '';

    meta = with lib; {
      description = "Pulumi Kubernetes Operator: manage Pulumi Stack CRs in-cluster";
      homepage = "https://github.com/pulumi/pulumi-kubernetes-operator";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

  # Top-level /manager symlink so the chart's hardcoded
  # `command: ["/manager"]` resolves. Same pattern as the keda chart's
  # `/keda` symlink in PR #39 and the cloudnative-pg chart's `/manager`
  # symlink in PR #44.
  managerCompat = pkgs.runCommand "pko-manager-compat" {} ''
    mkdir -p $out
    ln -s ${pkoBin}/bin/manager $out/manager
  '';
in
mkImage {
  drv = pkoBin;
  name = "pulumi-kubernetes-operator";
  tag = "v${version}";
  entrypoint = [ "${pkoBin}/bin/manager" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];
  extraContents = [ managerCompat ];

  labels = {
    "org.opencontainers.image.title" = "Pulumi Kubernetes Operator";
    "org.opencontainers.image.description" = "Manage Pulumi Stack CRs in-cluster";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.image.upstream" = "https://github.com/pulumi/pulumi-kubernetes-operator";
    "io.nix-containers.image.category" = "operator";
  };

  user = nonRoot.userString;
}
