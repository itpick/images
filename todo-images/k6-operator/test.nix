{ pkgs, lib, ... }:

# TODO: Add tests for k6-operator image
{
  name = "k6-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k6-operator"
    exit 1
  '';
}
