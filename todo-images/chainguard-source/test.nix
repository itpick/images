{ pkgs, lib, ... }:

# TODO: Add tests for chainguard-source image
{
  name = "chainguard-source";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for chainguard-source"
    exit 1
  '';
}
