{ pkgs, lib, ... }:

# TODO: Add tests for polaris image
{
  name = "polaris";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for polaris"
    exit 1
  '';
}
