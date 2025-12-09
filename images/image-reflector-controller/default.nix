{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for image-reflector-controller:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   flux-image-reflector-controller (1.0.4-r3)
#   ld-linux (2.42-r4)

let
  version = "1.0.4";
  image-reflector-controller = buildGoModule {
    pname = "image-reflector-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "image-reflector-controller";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.VERSION=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Flux image-reflector-controller for scanning container registries";
      homepage = "https://github.com/fluxcd/image-reflector-controller";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = image-reflector-controller;
  name = "image-reflector-controller";
  tag = "v${version}";
  entrypoint = [ "${image-reflector-controller}/bin/image-reflector-controller" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Flux Image Reflector Controller";
    "org.opencontainers.image.description" = "Scans container registries for new images";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux2";
  };
}
