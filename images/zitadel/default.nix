{ mkImage, pkgs, lib, nonRoot, ... }:

# Zitadel v4 from upstream's GitHub release binary.
#
# nixpkgs (`pkgs.zitadel`) is stuck on v2.71.7 -- the chart's v4
# zitadel-login UI talks v4 gRPC endpoints that v2 backends return
# UNIMPLEMENTED for, so a chart-driven swap to a nixpkgs-backed image
# takes SSO down. Until nixpkgs catches up, we ship a custom
# derivation that pulls the upstream-signed release tarball directly.
#
# To bump: change `version` + `hash` below. SRI hash from
#   nix hash convert --to-sri --hash-algo sha256 \
#     "$(curl -sL https://github.com/zitadel/zitadel/releases/download/v${version}/checksums.txt \
#         | grep 'zitadel-linux-amd64.tar.gz' | awk '{print $1}')"

let
  version = "4.15.1";

  zitadelBin = pkgs.stdenvNoCC.mkDerivation {
    pname = "zitadel";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/zitadel/zitadel/releases/download/v${version}/zitadel-linux-amd64.tar.gz";
      hash = "sha256-HANVrRvcZ0d0gDKsg2t+OYvZ87lZpozEAiGIFuMeqKk=";
    };

    # Upstream tarball nests everything under zitadel-linux-amd64/.
    # Just extract and place the binary at $out/bin/zitadel + ship
    # the LICENSE so license-scanners are happy.
    sourceRoot = "zitadel-linux-amd64";
    dontConfigure = true;
    dontBuild = true;
    installPhase = ''
      runHook preInstall
      install -Dm755 zitadel $out/bin/zitadel
      install -Dm644 LICENSE $out/share/zitadel/LICENSE
      runHook postInstall
    '';

    meta = with lib; {
      description = "Identity and access management platform (v4 from upstream release binary)";
      homepage = "https://zitadel.com/";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };
in
mkImage {
  drv = zitadelBin;
  name = "zitadel";
  tag = "v${version}";
  entrypoint = [ "${zitadelBin}/bin/zitadel" ];
  cmd = [];

  # Zitadel needs TLS certs + tzdata for scheduled jobs.
  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "Zitadel";
    "org.opencontainers.image.description" = "Identity and access management";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.image.upstream" = "https://github.com/zitadel/zitadel";
    "io.nix-containers.image.category" = "security";
    "io.nix-containers.image.aliases" = "zitadel,sso,iam";
  };

  user = nonRoot.userString;
}
