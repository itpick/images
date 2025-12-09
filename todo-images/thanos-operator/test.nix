{ pkgs, lib, ... }:

# TODO: Add tests for thanos-operator image
{
  name = "thanos-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for thanos-operator"
    exit 1
  '';
}
