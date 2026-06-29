{ mkImage, pkgs, lib, ... }:

# EKS Distro CoreDNS - packaged from the upstream CoreDNS release binary.
# https://github.com/coredns/coredns
let
  version = "1.14.4";

  drv = pkgs.stdenv.mkDerivation {
    pname = "eks-distro-coredns";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/coredns/coredns/releases/download/v${version}/coredns_${version}_linux_amd64.tgz";
      hash = "sha256:0vp3rw2k95gpwdbccm93hnmh7kl8ra1hx9xscpncmgcpidm6l3jv";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 coredns $out/bin/coredns
      runHook postInstall
    '';

    meta = with lib; {
      description = "CoreDNS DNS server (EKS Distro)";
      homepage = "https://github.com/coredns/coredns";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };
in mkImage {
  inherit drv;
  name = "eks-distro-coredns";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/coredns" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "eks-distro-coredns";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
