{ pkgs, lib, ... }:

# TODO: Add tests for azure-functions-node image
{
  name = "azure-functions-node";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for azure-functions-node"
    exit 1
  '';
}
