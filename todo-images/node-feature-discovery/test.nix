{ pkgs, lib, ... }:

# TODO: Add tests for node-feature-discovery image
{
  name = "node-feature-discovery";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for node-feature-discovery"
    exit 1
  '';
}
