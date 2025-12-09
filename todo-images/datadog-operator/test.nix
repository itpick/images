{ pkgs, lib, ... }:

# TODO: Add tests for datadog-operator image
{
  name = "datadog-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for datadog-operator"
    exit 1
  '';
}
