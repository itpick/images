{ pkgs, lib, ... }:

# TODO: Add tests for thanos-iamguarded image
{
  name = "thanos-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for thanos-iamguarded"
    exit 1
  '';
}
