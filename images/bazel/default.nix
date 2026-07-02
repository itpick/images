{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.bazel;
  name = "bazel";
  tag = "v${pkgs.bazel.version}";
  
  entrypoint = [ "bazel" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "bazel";
    "org.opencontainers.image.description" = "Last changed 2 days ago";
    "org.opencontainers.image.version" = pkgs.bazel.version;
  };
  
  user = nonRoot.userString;
}
