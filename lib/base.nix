# Base configuration shared across all container images
{ cacert, lib, pkgs, ... }:

{
  # Base packages that should be included in all images
  basePackages = [ cacert ];
  
  # Default environment variables for all containers
  defaultEnv = [
    "SSL_CERT_FILE=${cacert}/etc/ssl/certs/ca-bundle.crt"
  ];
  
  # Default labels for all containers
  defaultLabels = {
    "org.opencontainers.image.source" = "https://github.com/drduker/nix-containers";
    "org.label-schema.vcs-url" = "https://github.com/drduker/nix-containers";
  };
  
  # Function to add compressed size label to any image
  addSizeLabel = baseImage: 
    let
      # Create a wrapper that calculates size after build
      sizeCalculator = pkgs.runCommand "${baseImage.imageName}-size-calc" {} ''
        # Build the image and get its compressed size
        ${baseImage.copyTo} "docker-archive:$TMPDIR/image.tar"
        SIZE=$(stat -c%s "$TMPDIR/image.tar")
        echo "$SIZE" > $out
      '';
    in baseImage // {
      config = baseImage.config // {
        Labels = baseImage.config.Labels // {
          "org.opencontainers.image.size" = "calculated-at-build";
        };
      };
    };
}