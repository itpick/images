{ mkImage, pkgs, lib, ... }:

# CNI tuning plugin (from containernetworking/plugins)
# https://github.com/containernetworking/plugins
let
  version = "1.9.1";
  binary = "tuning";

  drv = pkgs.stdenv.mkDerivation {
    pname = "cni-plugins-${binary}";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/containernetworking/plugins/releases/download/v${version}/cni-plugins-linux-amd64-v${version}.tgz";
      hash = "sha256-uY90oPhSLwqDhnF4cpwapw8hWPkMRaLKj6eR2xx2swM=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];
    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 ./${binary} $out/bin/${binary}
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "cni-plugins-tuning";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/${binary}" ];
  cmd = [ ];

  labels = {
    "org.opencontainers.image.title" = "cni-plugins-tuning";
    "org.opencontainers.image.description" = "CNI tuning plugin";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
