{ mkImage, pkgs, lib, ... }:

# containerd-shim-runc-v2 (from containerd/containerd static release)
# -fips suffix denotes the same upstream tool; we package the upstream binary.
# https://github.com/containerd/containerd
let
  version = "2.3.2";
  binary = "containerd-shim-runc-v2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "${binary}-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/containerd/containerd/releases/download/v${version}/containerd-static-${version}-linux-amd64.tar.gz";
      hash = "sha256-9GThhDIfi1dhcL3HPcFV9I5rUJMdcY89zJRXRtUhOPo=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];
    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 bin/${binary} $out/bin/${binary}
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "containerd-shim-runc-v2-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/${binary}" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "containerd-shim-runc-v2-fips";
    "org.opencontainers.image.description" = "containerd runc v2 runtime shim";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
