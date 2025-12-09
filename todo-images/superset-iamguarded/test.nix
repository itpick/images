{ pkgs, lib, ... }:

# TODO: Add tests for superset-iamguarded image
{
  name = "superset-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for superset-iamguarded"
    exit 1
  '';
}
