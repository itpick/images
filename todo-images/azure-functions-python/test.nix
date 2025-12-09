{ pkgs, lib, ... }:

# TODO: Add tests for azure-functions-python image
{
  name = "azure-functions-python";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for azure-functions-python"
    exit 1
  '';
}
