{ pkgs, lib, ... }:

# TODO: Add tests for rancher image
{
  name = "rancher";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rancher"
    exit 1
  '';
}
