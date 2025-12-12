{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for envoy-gateway:
# Packages NOT in nixpkgs:
#   envoy-gateway (1.6.1-r0)

let
  version = "1.6.1";
  envoyGateway = buildGoModule {
    pname = "envoy-gateway";
    inherit version;

    src = fetchFromGitHub {
      owner = "envoyproxy";
      repo = "gateway";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/envoy-gateway" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s"
      "-w"
      "-X github.com/envoyproxy/gateway/internal/cmd/version.envoyGatewayVersion=${version}"
    ];

    postInstall = ''
      mkdir -p $out/usr/bin
      mv $out/bin/envoy-gateway $out/usr/bin/envoy-gateway
      rm -rf $out/bin
    '';

    doCheck = false;

    meta = with lib; {
      description = "Manages Envoy Proxy as a Standalone or Kubernetes-based Application Gateway";
      homepage = "https://github.com/envoyproxy/gateway";
      license = licenses.asl20;
      mainProgram = "envoy-gateway";
    };
  };

in
mkImage {
  # The derivation containing our binary
  drv = envoyGateway;

  # Optional: override defaults
  name = "envoy-gateway";
  tag = "v${version}";
  entrypoint = [ "/usr/bin/envoy-gateway" ];
  cmd = [ "server" ];

  # Optional: environment variables
  env = {
    LANG = "C.UTF-8";
  };

  # Optional: labels for OCI metadata
  labels = {
    "org.opencontainers.image.title" = "envoy-gateway";
    "org.opencontainers.image.description" = "Manages Envoy Proxy as a Standalone or Kubernetes-based Application Gateway";
    "org.opencontainers.image.version" = version;
    "org.opencontainers.image.source" = "https://github.com/envoyproxy/gateway";
  };
}
