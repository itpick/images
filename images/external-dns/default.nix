{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for external-dns:
# Packages NOT in nixpkgs:
#   external-dns-0.20 (0.20.0-r2)

let
  version = "0.24.0";
  externalDns = buildGoModule {
    pname = "external-dns";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "external-dns";
      rev = "v${version}";
      hash = "sha256-3NCwSCJD/estqITJxpuM2FD7hnQ4o1p0HhilQwW4Oo0=";
    };

    vendorHash = "sha256-QnCfamOyk9IpNK5DLc62ma5qHFhuhHdoEs4IdMXmZPs=";

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X sigs.k8s.io/external-dns/pkg/version.Version=v${version}"
    ];

    postInstall = ''
      mkdir -p $out/usr/bin
      mv $out/bin/external-dns $out/usr/bin/external-dns
      rm -rf $out/bin
    '';

    doCheck = false;

    meta = with lib; {
      description = "Configure external DNS servers (AWS Route53, Google CloudDNS and others) for Kubernetes Ingresses and Services";
      homepage = "https://github.com/kubernetes-sigs/external-dns";
      license = licenses.asl20;
    };
  };

in
mkImage {
  # The derivation containing our binary  
  drv = externalDns;
  
  # Optional: override defaults
  name = "external-dns";
  tag = "v${version}";
  entrypoint = [ "/usr/bin/external-dns" ];
  cmd = [ "--help" ];
  
  # Optional: environment variables
  env = {
    LANG = "C.UTF-8";
  };
  
  # Optional: labels for OCI metadata
  labels = {
    "org.opencontainers.image.title" = "external-dns";
    "org.opencontainers.image.description" = "Configure external DNS servers for Kubernetes Ingresses and Services";
    "org.opencontainers.image.version" = version;
  };
}