{ mkImage, pkgs, lib, ... }:

# gogatekeeper / gatekeeper - OAuth2/OIDC reverse proxy
# https://github.com/gogatekeeper/gatekeeper

let
  version = "4.10.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "gogatekeeper";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/gogatekeeper/gatekeeper/releases/download/${version}/gatekeeper_${version}_linux_amd64.tar.gz";
      hash = "sha256:19lpb4c8wwakxhj0bgvb7q304qv0q4p6mmw3632cf0alg9z5058k";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 gatekeeper_${version}_linux_amd64/gatekeeper $out/bin/gatekeeper
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "gogatekeeper";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/gatekeeper" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "gogatekeeper";
    "org.opencontainers.image.description" = "OAuth2/OIDC reverse proxy (Gatekeeper)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
