{ pkgs, lib, ... }:

# TODO: Add tests for rekor-cli image
{
  name = "rekor-cli";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rekor-cli"
    exit 1
  '';
}
