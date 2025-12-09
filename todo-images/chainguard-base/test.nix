{ pkgs, lib, ... }:

# TODO: Add tests for chainguard-base image
{
  name = "chainguard-base";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for chainguard-base"
    exit 1
  '';
}
