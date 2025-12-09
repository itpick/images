{ pkgs, lib, ... }:

# TODO: Add tests for karpenter image
{
  name = "karpenter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for karpenter"
    exit 1
  '';
}
