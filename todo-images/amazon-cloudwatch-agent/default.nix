{ buildCLIImage, pkgs, lib, ... }:

# Image: amazon-cloudwatch-agent
# Reference: https://images.chainguard.dev/directory/image/amazon-cloudwatch-agent/overview

# Packages available in nixpkgs:
#   pkgs.amazon-cloudwatch-agent  # amazon-cloudwatch-agent (1.300062.0-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   amazon-cloudwatch-agent-amazon-cloudwatch-agent-config-wizard (1.300062.0-r2)
#   amazon-cloudwatch-agent-config-downloader (1.300062.0-r2)
#   amazon-cloudwatch-agent-config-translator (1.300062.0-r2)
#   amazon-cloudwatch-agent-start-amazon-cloudwatch-agent (1.300062.0-r2)

# TODO: Implement amazon-cloudwatch-agent image
throw "Image 'amazon-cloudwatch-agent' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.amazon-cloudwatch-agent;
#   name = "amazon-cloudwatch-agent";
#   tag = "v${pkgs.amazon-cloudwatch-agent.version}";
#   entrypoint = [ "${pkgs.amazon-cloudwatch-agent}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "amazon-cloudwatch-agent";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
