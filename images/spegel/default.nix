{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for spegel:
# Packages NOT in nixpkgs:
#   spegel (0.5.1-r2)

let
  version = "0.7.2";
  spegel = buildGoModule {
    pname = "spegel";
    inherit version;

    src = fetchFromGitHub {
      owner = "spegel-org";
      repo = "spegel";
      rev = "v${version}";
      hash = "sha256-6U1DF6gy0L0m8tBcWQGPbIAEkiSSWBagYHgjPWfh9XQ=";
    };

    proxyVendor = true;
    vendorHash = "sha256-Brc5jR/2VYe07zmC/WUKBdtgz1AICvt7ORiCUN3Pfjg=";

    # 0.7.x moved test/integration/containerd out of the main go.mod tree —
    # restrict subPackages to the top-level binary so buildGoModule doesn't
    # try to walk into it.
    subPackages = [ "." ];

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
