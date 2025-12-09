{ pkgs, lib, ... }:

# TODO: Add tests for tetragon-operator image
{
  name = "tetragon-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tetragon-operator"
    exit 1
  '';
}
