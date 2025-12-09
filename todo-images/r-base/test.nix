{ pkgs, lib, ... }:

# TODO: Add tests for r-base image
{
  name = "r-base";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for r-base"
    exit 1
  '';
}
