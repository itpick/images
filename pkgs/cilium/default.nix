# Cilium - eBPF-based Networking, Security, and Observability
# https://github.com/cilium/cilium
#
# This package builds the main Cilium components:
# - cilium-agent: The main agent that runs on each node
# - cilium-operator: Kubernetes operator for Cilium
# - hubble-relay: Hubble relay for aggregating flow data
# - cilium (CLI): Command-line tool for interacting with Cilium

{ lib, fetchFromGitHub, buildGoModule, symlinkJoin }:

let
  version = "1.19.5";

  src = fetchFromGitHub {
    owner = "cilium";
    repo = "cilium";
    rev = "v${version}";
    hash = "sha256-0/GlsmRG6YuHJ8ROoVrCiksFf1+wokxUEzO6V6gvme4=";
  };

  commonAttrs = {
    inherit version src;
    env = {
      CGO_ENABLED = 0;
      # Reduce memory usage during compilation (lower value = more frequent GC)
      GOGC = "50";
      # Limit memory per build
      GOMEMLIMIT = "3GiB";
    };
    doCheck = false;
    meta = with lib; {
      description = "eBPF-based Networking, Security, and Observability";
      homepage = "https://cilium.io";
      license = licenses.asl20;
    };
  };

  ldflags = [
    "-s" "-w"
    "-X github.com/cilium/cilium/pkg/version.Version=${version}"
  ];

  # Main cilium-agent package with all required binaries for the container
  cilium-agent = buildGoModule (commonAttrs // {
    pname = "cilium-agent";
    subPackages = [
      "daemon"                    # -> cilium-agent
      "cilium-dbg"                # CLI debug tool
      "cilium-health"             # Health checking client
      "cilium-health/responder"   # Health responder daemon
      "bugtool"                   # Bug report tool
      "tools/mount"               # -> cilium-mount (for init container)
      "tools/sysctlfix"           # -> cilium-sysctlfix (for init container)
      "plugins/cilium-cni"        # CNI plugin
    ];
    vendorHash = null;  # Uses vendored dependencies
    inherit ldflags;
    postInstall = ''
      mv $out/bin/daemon $out/bin/cilium-agent
      mv $out/bin/mount $out/bin/cilium-mount
      mv $out/bin/sysctlfix $out/bin/cilium-sysctlfix
      mv $out/bin/responder $out/bin/cilium-health-responder

      # Also create symlinks in /usr/bin for compatibility with helm chart init scripts
      mkdir -p $out/usr/bin
      ln -s $out/bin/cilium-mount $out/usr/bin/cilium-mount
      ln -s $out/bin/cilium-sysctlfix $out/usr/bin/cilium-sysctlfix

      # Install BPF source files required by cilium-agent at runtime
      mkdir -p $out/var/lib/cilium
      cp -r $src/bpf $out/var/lib/cilium/bpf
    '';
  });

  cilium-operator = buildGoModule (commonAttrs // {
    pname = "cilium-operator-generic";
    subPackages = [ "operator" ];
    vendorHash = null;
    inherit ldflags;
    postInstall = ''
      mv $out/bin/operator $out/bin/cilium-operator-generic
    '';
  });

  cilium-operator-aws = buildGoModule (commonAttrs // {
    pname = "cilium-operator-aws";
    subPackages = [ "operator" ];
    vendorHash = null;
    ldflags = ldflags ++ [
      "-X github.com/cilium/cilium/operator/pkg/model.EndpointGCInterval=0s"
    ];
    tags = [ "ipam_provider_aws" ];
    postInstall = ''
      mv $out/bin/operator $out/bin/cilium-operator-aws
    '';
  });

  hubble-relay = buildGoModule (commonAttrs // {
    pname = "hubble-relay";
    subPackages = [ "hubble-relay" ];
    vendorHash = null;
    inherit ldflags;
  });

in symlinkJoin {
  name = "cilium-${version}";
  paths = [ cilium-agent cilium-operator cilium-operator-aws hubble-relay ];
  passthru = {
    inherit version cilium-agent cilium-operator cilium-operator-aws hubble-relay;
  };
}
