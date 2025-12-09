{ pkgs, lib, ... }:

# TODO: Add tests for superset image
{
  name = "superset";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for superset"
    exit 1
  '';
}
