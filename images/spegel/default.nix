{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for spegel:
# Packages NOT in nixpkgs:
#   spegel (0.5.1-r2)

let
  version = "0.0.27";
  spegel = buildGoModule {
    pname = "spegel";
    inherit version;

    src = fetchFromGitHub {
      owner = "spegel-org";
      repo = "spegel";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Stateless cluster local OCI registry mirror";
      homepage = "https://github.com/spegel-org/spegel";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = spegel;
  name = "spegel";
  tag = "v${version}";
  entrypoint = [ "${spegel}/bin/spegel" ];
  cmd = [];
  # Chainguard runs spegel as root
  user = "0:0";

  labels = {
    "org.opencontainers.image.title" = "Spegel";
    "org.opencontainers.image.description" = "Stateless cluster local OCI registry mirror";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "spegel";
  };
}
