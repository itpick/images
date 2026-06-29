{ mkImage, pkgs, lib, ... }:

# linkerd-network-validator - validates the iptables rules required by the
# Linkerd proxy. Shipped from the linkerd2-proxy-init repo.
# https://github.com/linkerd/linkerd2-proxy-init

let
  version = "0.1.9";

  drv = pkgs.stdenv.mkDerivation {
    pname = "linkerd-network-validator";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/linkerd/linkerd2-proxy-init/releases/download/validator/v${version}/linkerd-network-validator-v${version}-amd64-linux.tgz";
      hash = "sha256:0pgw8a5bqhbn09xzw9xr8zmqa5i3q49y8p832r76rwsdl86yymb5";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 */linkerd-network-validator $out/bin/linkerd-network-validator
      runHook postInstall
    '';

    meta = with lib; {
      description = "Validates iptables rules required by the Linkerd proxy";
      homepage = "https://github.com/linkerd/linkerd2-proxy-init";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "linkerd-network-validator";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/linkerd-network-validator" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "linkerd-network-validator";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
