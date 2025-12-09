{ pkgs, lib, ... }:

# TODO: Add tests for rekor-server image
{
  name = "rekor-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rekor-server"
    exit 1
  '';
}
