{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for external-dns:
# Packages NOT in nixpkgs:
#   external-dns-0.20 (0.20.0-r2)

let
  version = "0.21.0";
  externalDns = buildGoModule {
    pname = "external-dns";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "external-dns";
      rev = "v${version}";
      hash = "sha256-oqEMIfq7wh3tPjO6ZZ9gwgEE6TwSWaP3GiUwhybo2B4=";
    };

    vendorHash = "sha256-3q/8CODlIDVNdl1EhyFM6c3+IQyO9vtDl8uhXZXPNEI=";

    env.CGO_ENABLED = 0;

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