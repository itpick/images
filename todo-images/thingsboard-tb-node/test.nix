{ pkgs, lib, ... }:

# TODO: Add tests for thingsboard-tb-node image
{
  name = "thingsboard-tb-node";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for thingsboard-tb-node"
    exit 1
  '';
}
