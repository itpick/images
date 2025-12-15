# netshoot
# =============
# Network troubleshooting Swiss-Army container
# Contains many networking tools for debugging and testing
# https://github.com/nicolaka/netshoot

{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Netshoot is a comprehensive networking troubleshooting image
# that includes many common network debugging tools

let
  netshootPackages = with pkgs; [
    # Core networking tools
    iproute2          # ip, ss, tc
    iputils           # ping, tracepath
    netcat-gnu        # nc
    curl              # HTTP client
    wget              # HTTP client
    bind              # dig, nslookup
    tcpdump           # Packet capture
    nmap              # Network scanner
    traceroute        # Traceroute
    mtr               # Network diagnostic
    iperf3            # Network performance
    ethtool           # Ethernet tool
    bridge-utils      # brctl
    iftop             # Network bandwidth monitor
    nethogs           # Per-process bandwidth

    # TLS/SSL tools
    openssl           # SSL/TLS toolkit
    cacert            # CA certificates

    # General utilities
    bash
    coreutils
    gnugrep
    gnused
    gawk
    procps            # ps, top
    strace            # System call tracer
    lsof              # List open files
    file              # File type detection
    which
    tree
    jq                # JSON processing
    vim               # Text editor

    # DNS tools
    ldns              # drill
    whois
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "netshoot";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "netshoot-root";
      paths = base.basePackages ++ netshootPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath netshootPackages}"
    ];
    Entrypoint = [ "${pkgs.bash}/bin/bash" ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "Netshoot";
      "org.opencontainers.image.description" = "Network troubleshooting Swiss-Army container with common debugging tools";
    };
  };
}
