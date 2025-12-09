{ mkImage, kubectl, nonRoot, ... }:


# Chainguard SBOM packages for kubectl:
# Packages available in nixpkgs:
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
# Packages NOT in nixpkgs:
#   kubectl-1.34-default (1.34.2-r3)

mkImage {
  # The derivation or package you want in the image
  drv = kubectl;

  # Optional: override the command/entrypoint  
  entrypoint = [ "kubectl" ];
  cmd = [ "--help" ];

  # Optional: environment variables baked into the image
  env = {
    KUBECONFIG = "/home/${nonRoot.user.name}/.kube/config";
    LANG = "C.UTF-8";
  };

  # Optional: labels for OCI metadata
  labels = {
    "org.opencontainers.image.title" = "kubectl";
    "org.opencontainers.image.description" = "Kubernetes command-line tool";
    "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
    "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
    "org.opencontainers.image.vendor" = "nix-containers";
    "org.opencontainers.image.version" = kubectl.version;
    "io.nix-containers.image.upstream" = "https://kubernetes.io/";
    "io.nix-containers.image.category" = "devops-tool";
    "io.nix-containers.image.aliases" = "kubectl,kubernetes,k8s,cli";
  };

  # Optional: user/group to run as
  user = nonRoot.userString; # non-root
}