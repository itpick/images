{ pkgs, lib, ... }:

# TODO: Add tests for sonobuoy image
{
  name = "sonobuoy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sonobuoy"
    exit 1
  '';
}
