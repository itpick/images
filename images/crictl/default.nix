{ mkImage, pkgs, lib, ... }:

# crictl - CLI for CRI-compatible container runtimes
# https://github.com/kubernetes-sigs/cri-tools

let
  version = "1.36.0";

  crictl = pkgs.stdenv.mkDerivation rec {
    pname = "crictl";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/kubernetes-sigs/cri-tools/releases/download/v${version}/crictl-v${version}-linux-amd64.tar.gz";
      hash = "sha256-g4VeEUVmqKjETFSNUVZw9R3jpeHaiy7/tZhw4vEMJaM=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp crictl $out/bin/crictl
      chmod +x $out/bin/crictl
      runHook postInstall
    '';

    meta = with lib; {
      description = "CLI for CRI-compatible container runtimes";
      homepage = "https://github.com/kubernetes-sigs/cri-tools";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  drv = crictl;
  name = "crictl";
  tag = "v${version}";
  entrypoint = [ "${crictl}/bin/crictl" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "crictl";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
