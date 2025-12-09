{ pkgs, lib, ... }:

# TODO: Add tests for cilium-operator-aws image
{
  name = "cilium-operator-aws";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cilium-operator-aws"
    exit 1
  '';
}
