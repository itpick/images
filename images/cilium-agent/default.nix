{ mkImage, pkgs, lib, ... }:

# Cilium Agent - eBPF-based networking, security, and observability for Kubernetes
# https://github.com/cilium/cilium

let
  # Create /bin/sh symlink to /bin/bash (absolute path in container filesystem)
  # Note: We use /bin/bash not ${pkgs.bash}/bin/bash because nix2container
  # flattens packages to /bin, so the nix store path won't exist in the container
  shLink = pkgs.runCommand "sh-link" {} ''
    mkdir -p $out/bin
    ln -s /bin/bash $out/bin/sh
  '';

  # Create /usr/bin symlinks for init container scripts that expect tools there
  usrBinLinks = pkgs.runCommand "usr-bin-links" {} ''
    mkdir -p $out/usr/bin
    ln -s /bin/cilium-mount $out/usr/bin/cilium-mount
    ln -s /bin/cilium-sysctlfix $out/usr/bin/cilium-sysctlfix
  '';

  # Extract specific tools from util-linux (avoids conflicts with coreutils)
  utilLinuxBins = pkgs.runCommand "util-linux-bins" {} ''
    mkdir -p $out/bin
    cp ${pkgs.util-linux}/bin/nsenter $out/bin/
    cp ${pkgs.util-linux}/bin/mount $out/bin/
    cp ${pkgs.util-linux}/bin/umount $out/bin/
  '';

  # Create init scripts needed by Cilium Helm chart
  initScripts = pkgs.runCommand "cilium-init-scripts" {} ''
    mkdir -p $out

    # init-container.sh - cleanup script
    cat > $out/init-container.sh << 'SCRIPT'
#!/bin/sh

# Check for CLEAN_CILIUM_BPF_STATE and CLEAN_CILIUM_STATE
# is there for backwards compatibility as we've used those
# two env vars in our old kubernetes yaml files.

if [ "''${CILIUM_BPF_STATE}" = "true" ] \
   || [ "''${CLEAN_CILIUM_BPF_STATE}" = "true" ]; then
	cilium-dbg post-uninstall-cleanup -f --bpf-state
fi

if [ "''${CILIUM_ALL_STATE}" = "true" ] \
    || [ "''${CLEAN_CILIUM_STATE}" = "true" ]; then
	cilium-dbg post-uninstall-cleanup -f --all-state
fi
SCRIPT
    chmod +x $out/init-container.sh

    # install-plugin.sh - CNI plugin installer
    # Uses $1 if provided, otherwise defaults to /host/opt/cni/bin (helm chart mount path)
    cat > $out/install-plugin.sh << 'SCRIPT'
#!/bin/sh
CNI_BIN_DIR="''${1:-/host/opt/cni/bin}"
cp /bin/cilium-cni "$CNI_BIN_DIR/cilium-cni"
chmod +x "$CNI_BIN_DIR/cilium-cni"
SCRIPT
    chmod +x $out/install-plugin.sh

    # cni-uninstall.sh - CNI plugin uninstaller
    cat > $out/cni-uninstall.sh << 'SCRIPT'
#!/bin/sh
CNI_BIN_DIR="''${1:-/host/opt/cni/bin}"
rm -f "$CNI_BIN_DIR/cilium-cni"
SCRIPT
    chmod +x $out/cni-uninstall.sh
  '';
in
mkImage {
  drv = pkgs.cilium.cilium-agent;
  name = "cilium-agent";
  tag = "v${pkgs.cilium.version}";
  entrypoint = [ "${pkgs.cilium.cilium-agent}/bin/cilium-agent" ];

  # Skip busybox because iproute2 provides /bin/ip which conflicts
  noBusybox = true;

  extraPkgs = with pkgs; [
    cacert
    iproute2
    iptables
    ipset
    kmod
    bash         # Required for Helm chart init containers
    coreutils    # Required for cp, etc.
    gnugrep      # Required for mount-bpf-fs init container
    utilLinuxBins # nsenter, mount, umount from util-linux (avoids conflicts)
    shLink       # /bin/sh symlink to bash
    usrBinLinks  # /usr/bin symlinks for init containers
    initScripts  # /init-container.sh, /install-plugin.sh, /cni-uninstall.sh
    # BPF compilation toolchain - use unwrapped binaries to avoid setup-hook conflicts
    llvmPackages.clang-unwrapped
    llvmPackages.llvm
    gnumake
  ];

  # Add /bin to PATH for shell scripts in init containers
  env = {
    PATH = "/bin:${pkgs.cilium.cilium-agent}/bin";
  };

  # Run as root - required for privileged networking operations and init containers
  user = "0:0";

  labels = {
    "org.opencontainers.image.title" = "Cilium Agent";
    "org.opencontainers.image.description" = "eBPF-based networking, security, and observability for Kubernetes";
    "org.opencontainers.image.version" = pkgs.cilium.version;
    "io.nix-containers.chart" = "cilium";
  };
}
