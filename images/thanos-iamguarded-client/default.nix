{ mkImage, pkgs, lib, ... }:

# thanos - Highly available Prometheus setup with long-term storage capabilities
# -iamguarded suffix is the same upstream thanos binary
# https://github.com/thanos-io/thanos

let
  version = "0.41.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "thanos-iamguarded-client";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/thanos-io/thanos/releases/download/v${version}/thanos-${version}.linux-amd64.tar.gz";
      hash = "sha256:1va9yg7bmkav8wi82jvxga5ln4zg76ygh829mxzvlr8n7vslgkbb";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "thanos-${version}.linux-amd64";

    installPhase = ''
      runHook preInstall
      install -Dm755 thanos $out/bin/thanos
      runHook postInstall
    '';

    meta = with lib; {
      description = "Highly available Prometheus setup with long-term storage";
      homepage = "https://github.com/thanos-io/thanos";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "thanos-iamguarded-client";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/thanos" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "thanos-iamguarded-client";
    "org.opencontainers.image.description" = "Thanos - HA Prometheus with long-term storage";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
