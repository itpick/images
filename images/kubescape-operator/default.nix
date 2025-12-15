{ mkImage, pkgs, nonRoot, ... }:

# Kubescape Operator - Kubernetes security platform operator
# Tests Kubernetes clusters for security and compliance

mkImage {
  drv = pkgs.kubescape;
  name = "kubescape-operator";
  tag = "v${pkgs.kubescape.version}";

  entrypoint = [ "${pkgs.kubescape}/bin/kubescape" ];
  cmd = [ "--help" ];

  env = {
    HOME = "/home/${nonRoot.user.name}";
  };

  labels = {
    "org.opencontainers.image.title" = "Kubescape Operator";
    "org.opencontainers.image.description" = "Kubernetes security platform for testing clusters";
    "org.opencontainers.image.version" = pkgs.kubescape.version;
  };

  user = nonRoot.userString;
}
