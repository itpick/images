{ pkgs, lib, ... }:

# TODO: Add tests for nfpm image
{
  name = "nfpm";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nfpm"
    exit 1
  '';
}
